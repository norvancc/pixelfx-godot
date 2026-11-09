"""Freeze a declarative batch only after its full native movie has been reviewed."""
from pathlib import Path
from datetime import datetime, timezone
import argparse
import hashlib
import json
import math
import re
import subprocess

ROOT = Path(__file__).resolve().parents[2]
BUILD = ROOT / "builds/pixelfx"
PINNED = "a84159688af3ca37a4be05a0d422b94451b2e24e"


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("config", type=Path)
    parser.add_argument("--visual-reviewed", action="store_true", required=True)
    args = parser.parse_args()
    config_path = args.config.resolve()
    config = json.loads(config_path.read_text())
    batch = config["id"]
    if not re.fullmatch(r"[a-z0-9-]+", batch):
        raise SystemExit("Invalid batch id")
    rows = config["effects"]
    reports = {}
    for phase in ["parity", "runtime", "catalog", "soak"]:
        reports[phase] = json.loads((BUILD / f"{phase}-{batch}.json").read_text())
        if reports[phase].get("failures") != []:
            raise SystemExit(f"{phase} has not passed")
        log = (BUILD / f"{phase}-{batch}.log").read_text()
        if re.search(r"(?m)(SCRIPT ERROR:|ERROR:)", log):
            raise SystemExit(f"{phase} contains engine errors")
    editor = json.loads((BUILD / "editor-v010.json").read_text())
    if editor.get("failures") != []:
        raise SystemExit("Editor integration has not passed")
    cases = reports["parity"]["cases"]
    reference = json.loads((BUILD / f"reference-{batch}/cases.json").read_text())["cases"]
    if {case["name"] for case in cases} != {case["name"] for case in reference}:
        raise SystemExit("Parity did not check every reference case")
    if {case["effect"] for case in cases} != {row["id"] for row in rows}:
        raise SystemExit("Parity is missing an effect")
    if reports["runtime"]["checks"] < len(rows)*12 or reports["catalog"]["checks"] < len(rows)*8:
        raise SystemExit("Runtime or bounds coverage is incomplete")
    if reports["soak"]["replays"] != len(rows)*16:
        raise SystemExit("Replay coverage is incomplete")
    movie = BUILD / f"{batch}-native.mp4"
    probe = json.loads(subprocess.check_output([
        "ffprobe", "-v", "error", "-count_frames", "-show_entries",
        "format=duration:stream=width,height,avg_frame_rate,nb_read_frames", "-of", "json", str(movie),
    ]))
    stream = probe["streams"][0]
    visual = json.loads((BUILD / f"{batch}-visual-frames.json").read_text())
    expected_frames = 0
    effects = {}
    for row in rows:
        implementation = "addons/pixelfx/effects/"+row["source"].split("/")[0]+"/"+row["id"]+".gd"
        source = (ROOT / implementation).read_text()
        meta = json.loads(next(line.removeprefix("const META = ") for line in source.splitlines() if line.startswith("const META = ")))
        expected_frames += 2*math.ceil(max(3.0,meta["duration"]+0.6)*30)
        selected = [case for case in cases if case["effect"] == row["id"]]
        names = {case["name"] for case in selected}
        if not {f"{row['id']}-cycle-{i}" for i in range(math.ceil(meta["duration"]*30))} <= names:
            raise SystemExit("Default lifecycle references are incomplete: "+row["id"])
        for phase in [0,1]:
            images = [sample for sample in visual["samples"] if sample["id"] == row["id"] and sample["phase"] == phase]
            if len(images) < 6 or not all((ROOT / sample["path"]).is_file() for sample in images):
                raise SystemExit("Native lifecycle images are incomplete: "+row["id"])
        effects[row["source"]] = {
            "implementation": implementation, "implementation_sha256": digest(ROOT / implementation),
            "stateful": row["stateful"], "parity_cases": len(selected),
            "byte_exact": sum(case["changed_bytes"] == 0 for case in selected),
            "performance": reports["catalog"]["performance"][row["id"]],
        }
    if stream["avg_frame_rate"] != "30/1" or int(stream["nb_read_frames"]) != expected_frames or visual["expected_frames"] != expected_frames:
        raise SystemExit("Native movie frame count/fps is incomplete")
    if [stream["width"],stream["height"]] != [1120,740]:
        raise SystemExit("Unexpected native recording dimensions")
    poster = ROOT / f"docs/images/{batch}-effects.png"
    files = list((ROOT / "addons/pixelfx").rglob("*.gd")) + list((ROOT / "addons/pixelfx/presets").glob("*.tres"))
    gallery = ROOT / config["gallery"]
    files += [config_path, gallery, gallery.with_suffix(".gd"), poster]
    output = {
        "passed": True, "accepted_at": datetime.now(timezone.utc).isoformat(), "upstream_revision": PINNED,
        "scope": f"{batch}: {len(rows)} native effects, local macOS acceptance; Linux Godot 4.3 is recorded by PR CI.",
        "environment": reports["runtime"]["environment"],
        "verification": {"config": config_path.relative_to(ROOT).as_posix(), "reference_cases": [
            "tools/pixelfx/reference_batch.mjs", "tests/pixelfx/test_batch_parity.gd", config_path.relative_to(ROOT).as_posix(),
        ]},
        "parity": {"cases": len(cases), "byte_exact": sum(case["changed_bytes"] == 0 for case in cases),
                   "default_tolerance": {"max_channel_error":1,"changed_bytes":20}, "audited_exceptions": config.get("tolerances",{})},
        "runtime_checks": reports["runtime"]["checks"], "catalog_checks": reports["catalog"]["checks"],
        "editor_checks": editor["checks"], "replay_soak": reports["soak"],
        "native_visual": {"reviewed": args.visual_reviewed,"effect_ids":[row["source"] for row in rows],
                          "frames":expected_frames,"fps":30,"seconds":float(probe["format"]["duration"]),
                          "size":[stream["width"],stream["height"]],"movie":movie.relative_to(ROOT).as_posix(),"movie_sha256":digest(movie),
                          "poster":poster.relative_to(ROOT).as_posix(),"poster_sha256":digest(poster),
                          "coverage":["all effects","dark/light backgrounds","mirroring","complete lifecycles and loop seams","front/back occlusion"],
                          "limitation":"Fixed-frame native recording is visual evidence, not a real-time FPS guarantee."},
        "source_sha256": {file.relative_to(ROOT).as_posix():digest(file) for file in sorted(set(files))}, "effects":effects,
    }
    (ROOT / "addons/pixelfx/validation" / (batch+".json")).write_text(json.dumps(output,ensure_ascii=False,indent=2)+"\n")
    print(f"Wrote source-hashed acceptance for {batch}: {len(rows)} effects / {len(cases)} reference cases")


if __name__ == "__main__":
    main()
