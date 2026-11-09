"""Build the pinned-upstream migration ledger.

The ledger is deliberately generated from the pinned checkout instead of from
the Godot directory.  That keeps the denominator stable and makes omissions
visible before an effect is implemented.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
PINNED = "a84159688af3ca37a4be05a0d422b94451b2e24e"
PLAN = ROOT / "docs/plans/full-migration.zh-CN.md"
OUT = ROOT / "docs/migration-status.json"

EXISTING = {
    "fire/fireball": "addons/pixelfx/effects/fireball.gd",
    "ice/ice-lance": "addons/pixelfx/effects/ice_lance.gd",
    "projectiles/laser-bolt": "addons/pixelfx/effects/laser_bolt.gd",
    "holy/sunburst": "addons/pixelfx/effects/sunburst.gd",
    "water/ripples": "addons/pixelfx/effects/ripples.gd",
}
PROBES = {
    "impacts/hit-spark": {"batch": "B1", "render_type": "stateful", "review": "create() 持有 Particles/Lights 实例；一次性命中火花。"},
    "explosions/small-explosion": {"batch": "B1", "render_type": "stateful", "review": "create() 持有粒子、岩块、火焰和光照状态；一次性长生命周期爆炸。"},
    "spawn/poof": {"batch": "B1", "render_type": "stateful", "review": "create() 持有烟团、星星和光照状态；一次性生成/消散。"},
    "fire/campfire": {"batch": "B1", "render_type": "analytic", "review": "纯 draw(t) 循环火焰；复用 fire/_lib 的 looped 与噪声。"},
    "projectiles/rocket": {"batch": "B1", "render_type": "analytic", "review": "纯 draw(t) 循环弹体；依赖 projectiles/_lib 的 beat 与像素形状。"},
    "water/splash": {"batch": "B1", "render_type": "stateful", "review": "create() 持有 Drops/Ripples/Mist 状态；一次性水花并包含多层落点。"},
}
PROBE_PATHS = {
    "impacts/hit-spark": "addons/pixelfx/effects/impacts/hit_spark.gd",
    "spawn/poof": "addons/pixelfx/effects/spawn/poof.gd",
    "fire/campfire": "addons/pixelfx/effects/fire/campfire.gd",
    "projectiles/rocket": "addons/pixelfx/effects/projectiles/rocket.gd",
    "explosions/small-explosion": "addons/pixelfx/effects/explosions/small_explosion.gd",
    "water/splash": "addons/pixelfx/effects/water/splash.gd",
}


def source_root(path: Path) -> Path:
    if (path / "src/fx").is_dir():
        return path
    candidate = ROOT / "builds/pixelfx/upstream" / PINNED
    if (candidate / "src/fx").is_dir():
        return candidate
    raise SystemExit("Pinned upstream checkout not found; run fetch_reference.py first")


def plan_batches() -> dict[str, str]:
    text = PLAN.read_text()
    batches: dict[str, str] = {}
    for number in range(2, 10):
        marker = f"### B{number}（"
        if marker not in text:
            raise SystemExit(f"Missing {marker} in migration plan")
        body = text.split(marker, 1)[1].split("\n### ", 1)[0]
        for effect in re.findall(r"^- `([^`]+)`", body, flags=re.MULTILINE):
            batches[effect] = f"B{number}"
    for effect in EXISTING:
        batches[effect] = "B0"
    for effect in PROBES:
        batches[effect] = "B1"
    return batches


def imports(path: Path) -> list[str]:
    result = []
    for line in path.read_text().splitlines():
        match = re.search(r'from ["\']([^"\']+)["\']', line)
        if match:
            result.append(match.group(1))
        match = re.search(r'import ["\']([^"\']+)["\']', line)
        if match:
            result.append(match.group(1))
    return sorted(set(result))


def render_type(path: Path) -> str:
    text = path.read_text()
    return "stateful" if re.search(r"export function create\s*\(", text) else "analytic"


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("upstream", nargs="?", type=Path)
    parser.add_argument("--output", type=Path, default=OUT)
    args = parser.parse_args()
    upstream = source_root(args.upstream) if args.upstream else source_root(ROOT)
    batches = plan_batches()
    files = sorted((upstream / "src/fx").rglob("*.js"))
    effects = [p for p in files if p.name not in {"_lib.js", "index.js", "categories.js"}]
    ids = [p.relative_to(upstream / "src/fx").with_suffix("").as_posix() for p in effects]
    if len(ids) != 244 or len(set(ids)) != 244:
        raise SystemExit(f"Expected 244 unique upstream effects, found {len(ids)}")
    if set(ids) != set(batches):
        missing = sorted(set(ids) - set(batches))
        extra = sorted(set(batches) - set(ids))
        raise SystemExit(f"Plan/catalog mismatch; missing={missing}, extra={extra}")

    acceptance_path = ROOT / "addons/pixelfx/validation/b1.json"
    acceptance = json.loads(acceptance_path.read_text()) if acceptance_path.exists() else {}
    hashes = acceptance.get("source_sha256", {})
    current = bool(hashes) and all((ROOT / name).is_file() and hashlib.sha256((ROOT / name).read_bytes()).hexdigest() == value for name, value in hashes.items())
    accepted = acceptance.get("effects", {}) if acceptance.get("passed") and current else {}
    entries = []
    for path, effect_id in zip(effects, ids):
        rel = f"src/fx/{path.relative_to(upstream / 'src/fx').as_posix()}"
        source_hash = hashlib.sha256(path.read_bytes()).hexdigest()
        is_existing = effect_id in EXISTING
        probe = PROBES.get(effect_id)
        record = accepted.get(effect_id, {})
        implementation = ROOT / PROBE_PATHS[effect_id] if effect_id in PROBE_PATHS else None
        probe_passed = bool(record) and implementation and record.get("implementation_sha256") == hashlib.sha256(implementation.read_bytes()).hexdigest()
        status = "完成" if is_existing or probe_passed else ("实现中" if effect_id in PROBE_PATHS else "待分析")
        godot_path = EXISTING.get(effect_id) or PROBE_PATHS.get(effect_id)
        entries.append({
            "upstream_id": effect_id,
            "effect": effect_id,
            "source": {"path": rel, "sha256": source_hash},
            "batch": batches[effect_id],
            "dependencies": imports(path),
            "render_type": "analytic" if is_existing else (probe["render_type"] if probe else render_type(path)),
            "status": status,
            "godot_path": godot_path,
            "reference_cases": ["tools/pixelfx/reference.mjs", "tests/pixelfx/test_parity.gd"] if is_existing else (["tools/pixelfx/reference_b1.mjs", "tests/pixelfx/test_b1_parity.gd"] if effect_id in PROBE_PATHS else []),
            "visual_evidence": ["docs/images/five-effects.png"] if is_existing else (["docs/images/b1-effects.png", "addons/pixelfx/validation/b1.json"] if probe_passed else []),
            "performance_report": ["addons/pixelfx/docs/PERFORMANCE.md"] if is_existing else (["addons/pixelfx/validation/b1.json"] if probe_passed else []),
            "remaining_issues": [] if is_existing or probe_passed else (["像素参考、正常速度视觉录制和独立性能报告尚未完成。"] if effect_id in PROBE_PATHS else ([probe["review"]] if probe else ["尚未读取上游源码并建立迁移用例"])),
            "probe_review": probe["review"] if probe else None,
        })
    payload = {
        "schema_version": 1,
        "generated_from": {"repository": "https://github.com/patch-gg/pixelfx", "revision": PINNED, "package_version": "0.3.0"},
        "counts": {"upstream_effects": 244, "completed": sum(e["status"] == "完成" for e in entries), "remaining": sum(e["status"] != "完成" for e in entries)},
        "status_order": ["待分析", "依赖准备", "实现中", "像素验证", "运行/视觉验证", "完成"],
        "entries": entries,
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(payload, ensure_ascii=False, indent=2) + "\n")
    print(f"Wrote {args.output} ({len(entries)} effects)")


if __name__ == "__main__":
    main()
