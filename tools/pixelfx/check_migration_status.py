"""Validate the complete pinned-upstream migration ledger."""
from __future__ import annotations

import argparse
import hashlib
import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
PINNED = "a84159688af3ca37a4be05a0d422b94451b2e24e"
LEDGER = ROOT / "docs/migration-status.json"
BASELINE = {"fire/fireball", "ice/ice-lance", "projectiles/laser-bolt", "holy/sunburst", "water/ripples"}


def verify_hashes(report: dict, label: str) -> None:
    hashes = report.get("source_sha256", {})
    if not hashes:
        raise SystemExit(f"{label} acceptance has no implementation hashes")
    for name, digest in hashes.items():
        if not (ROOT / name).is_file() or hashlib.sha256((ROOT / name).read_bytes()).hexdigest() != digest:
            raise SystemExit(f"{label} acceptance is stale for {name}")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("upstream", type=Path)
    parser.add_argument("--ledger", type=Path, default=LEDGER)
    args = parser.parse_args()
    data = json.loads(args.ledger.read_text())
    entries = data.get("entries", [])
    ids = [entry.get("effect") for entry in entries]
    if data.get("schema_version") != 1:
        raise SystemExit("migration ledger schema_version must be 1")
    if data.get("generated_from", {}).get("revision") != PINNED:
        raise SystemExit("migration ledger is for the wrong pinned revision")
    if len(entries) != 244 or len(set(ids)) != 244 or any(not value for value in ids):
        raise SystemExit(f"migration ledger must contain 244 unique effects, found {len(entries)}")
    upstream_root = args.upstream / "src/fx"
    actual = sorted(p.relative_to(upstream_root).with_suffix("").as_posix() for p in upstream_root.rglob("*.js") if p.name not in {"_lib.js", "index.js", "categories.js"})
    if actual != sorted(ids):
        missing = sorted(set(actual) - set(ids))
        extra = sorted(set(ids) - set(actual))
        raise SystemExit(f"migration ledger does not match upstream; missing={missing}, extra={extra}")
    counts = {"完成": 0, "待分析": 0}
    verified = set(BASELINE)
    accepted_probes = [e for e in entries if e.get("batch") == "B1" and e.get("status") == "完成"]
    if accepted_probes:
        report = json.loads((ROOT / "addons/pixelfx/validation/b1.json").read_text())
        if not report.get("passed") or report.get("upstream_revision") != PINNED:
            raise SystemExit("completed B1 effects require the pinned acceptance report")
        verify_hashes(report, "B1")
        verified.update(report["effects"])
    b2 = json.loads((ROOT / "tests/pixelfx/b2_effects.json").read_text())
    b2_ids = {row["source"] for row in b2}
    if len(b2_ids) != 20:
        raise SystemExit("the B2 acceptance scope must contain exactly 20 unique effects")
    accepted_b2 = [entry for entry in entries if entry["effect"] in b2_ids and entry["status"] == "完成"]
    if accepted_b2:
        report = json.loads((ROOT / "addons/pixelfx/validation/b2.json").read_text())
        if len(accepted_b2) != 20 or not report.get("passed") or report.get("upstream_revision") != PINNED:
            raise SystemExit("completed B2 effects require the full pinned acceptance report")
        if set(report["effects"]) != b2_ids:
            raise SystemExit("B2 acceptance does not match the selected 20 effects")
        verify_hashes(report, "B2")
        verified.update(report["effects"])
    declared = set(verified) | b2_ids
    for config_path in sorted((ROOT / "tests/pixelfx/batches").glob("*.json")):
        config = json.loads(config_path.read_text())
        label = config.get("id", "")
        if not re.fullmatch(r"[a-z0-9-]+", label) or label != config_path.stem:
            raise SystemExit(f"Invalid migration batch id: {config_path}")
        scope = {row["source"] for row in config["effects"]}
        if not scope or len(scope) != len(config["effects"]) or scope & declared:
            raise SystemExit(f"Migration batch has empty/duplicate/overlapping scope: {label}")
        if not scope <= set(ids):
            raise SystemExit(f"Migration batch contains unknown upstream effects: {label}")
        declared.update(scope)
        selected = [entry for entry in entries if entry["effect"] in scope]
        if any(entry["batch"] != config["batch"] for entry in selected):
            raise SystemExit(f"Migration batch changes a planned milestone: {label}")
        completed = [entry for entry in selected if entry["status"] == "完成"]
        if not completed:
            continue
        if len(completed) != len(scope):
            raise SystemExit(f"Migration batch must pass acceptance as a complete scope: {label}")
        report_path = ROOT / "addons/pixelfx/validation" / (label + ".json")
        if not report_path.is_file():
            raise SystemExit(f"Completed batch has no acceptance report: {label}")
        report = json.loads(report_path.read_text())
        if not report.get("passed") or report.get("upstream_revision") != PINNED or set(report.get("effects", {})) != scope:
            raise SystemExit(f"Batch acceptance scope/revision is invalid: {label}")
        verify_hashes(report, label)
        if config_path.relative_to(ROOT).as_posix() not in report["source_sha256"]:
            raise SystemExit(f"Batch acceptance omits its reference/tolerance configuration: {label}")
        visual = report.get("native_visual", {})
        if not visual.get("reviewed") or visual.get("frames", 0) < 1 or set(visual.get("effect_ids", [])) != scope:
            raise SystemExit(f"Batch has incomplete native visual acceptance: {label}")
        for name, record in report["effects"].items():
            implementation = record.get("implementation")
            if implementation not in report["source_sha256"] or record.get("parity_cases", 0) < 1:
                raise SystemExit(f"Batch omits implementation/parity evidence: {name}")
        verified.update(scope)
    basic_entries = [entry for entry in entries if entry.get("status") == "已迁移（待完整验收）"]
    if basic_entries:
        basic = json.loads((ROOT / "addons/pixelfx/native/smoke.json").read_text())
        if basic.get("full_acceptance") is not False or basic.get("upstream_revision") != PINNED:
            raise SystemExit("Native basic-check evidence must retain its limited scope")
        verify_hashes(basic, "Native basic playback")
        passed_basic = {row["effect"] for row in basic.get("records", []) if not row.get("errors")}
        if any(entry["effect"] not in passed_basic for entry in basic_entries):
            raise SystemExit("Native basic-check evidence has incomplete coverage")
    uncovered = {entry["effect"] for entry in entries if entry["status"] == "完成"} - verified
    if uncovered:
        raise SystemExit(f"Completed effects have no current source-hashed acceptance: {sorted(uncovered)}")
    for entry in entries:
        source = entry.get("source", {})
        path = args.upstream / source.get("path", "")
        if not path.is_file():
            raise SystemExit(f"missing source for {entry['effect']}: {path}")
        digest = hashlib.sha256(path.read_bytes()).hexdigest()
        if digest != source.get("sha256"):
            raise SystemExit(f"source hash mismatch for {entry['effect']}")
        status = entry.get("status")
        if status not in {"待分析", "依赖准备", "实现中", "已迁移（待完整验收）", "像素验证", "运行/视觉验证", "完成"}:
            raise SystemExit(f"invalid status for {entry['effect']}: {status}")
        if status == "已迁移（待完整验收）":
            check = entry.get("basic_check", {})
            if not check.get("passed") or not (ROOT / check.get("report", "")).is_file():
                raise SystemExit(f"Ported entry has no basic-check evidence: {entry['effect']}")
            if not entry.get("godot_path") or not (ROOT / entry["godot_path"]).is_file():
                raise SystemExit(f"Ported entry has no implementation: {entry['effect']}")
        counts[status] = counts.get(status, 0) + 1
        if status == "完成" and (not entry.get("godot_path") or not (ROOT / entry["godot_path"]).is_file()):
            raise SystemExit(f"completed entry has no Godot path: {entry['effect']}")
    if data.get("counts", {}).get("upstream_effects") != 244:
        raise SystemExit("ledger counts.upstream_effects must remain 244")
    if data.get("counts", {}).get("completed") != counts.get("完成", 0):
        raise SystemExit("ledger completed count is stale")
    if data.get("counts", {}).get("remaining") != 244 - counts.get("完成", 0):
        raise SystemExit("ledger remaining count is stale")
    print(f"PIXELFX_MIGRATION_STATUS entries=244 completed={counts.get('完成', 0)} remaining={244-counts.get('完成', 0)}")


if __name__ == "__main__":
    main()
