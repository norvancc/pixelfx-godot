"""Validate the complete pinned-upstream migration ledger."""
from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
PINNED = "a84159688af3ca37a4be05a0d422b94451b2e24e"
LEDGER = ROOT / "docs/migration-status.json"


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
    accepted_probes = [e for e in entries if e.get("batch") == "B1" and e.get("status") == "完成"]
    if accepted_probes:
        report = json.loads((ROOT / "addons/pixelfx/validation/b1.json").read_text())
        if not report.get("passed") or report.get("upstream_revision") != PINNED:
            raise SystemExit("completed B1 effects require the pinned acceptance report")
        for name, digest in report["source_sha256"].items():
            if not (ROOT / name).is_file() or hashlib.sha256((ROOT / name).read_bytes()).hexdigest() != digest:
                raise SystemExit("B1 acceptance is stale for " + name)
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
        for name, digest in report["source_sha256"].items():
            if not (ROOT / name).is_file() or hashlib.sha256((ROOT / name).read_bytes()).hexdigest() != digest:
                raise SystemExit("B2 acceptance is stale for " + name)
    for entry in entries:
        source = entry.get("source", {})
        path = args.upstream / source.get("path", "")
        if not path.is_file():
            raise SystemExit(f"missing source for {entry['effect']}: {path}")
        digest = hashlib.sha256(path.read_bytes()).hexdigest()
        if digest != source.get("sha256"):
            raise SystemExit(f"source hash mismatch for {entry['effect']}")
        status = entry.get("status")
        if status not in {"待分析", "依赖准备", "实现中", "像素验证", "运行/视觉验证", "完成"}:
            raise SystemExit(f"invalid status for {entry['effect']}: {status}")
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
