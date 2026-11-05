# Contributing

Thank you for helping port PixelFX to Godot. Start with a small issue or pull request; check existing issues before claiming an effect to avoid duplicate work.

## Setup

Use Godot 4.3 or newer, Python 3.10+ and Node.js 18+. Import `project.godot` and run the demo. Keep `.godot/`, `builds/`, credentials, absolute personal paths and upstream checkouts out of commits.

Run `python3 tools/pixelfx/check.py`. Set `GODOT_BIN` if needed; `PIXELFX_UPSTREAM` may point to a checkout matching the pinned upstream hashes. The gate checks import, upstream provenance, pixel parity, runtime behavior and real editor integration; benchmark results are informational, not hardware-independent thresholds.

## Adding an effect

1. Identify the original file, commit, license and category helpers. Do not copy unlicensed assets.
2. Implement the contract described in [AUTHORING.md](docs/AUTHORING.md). Keep algorithms and effect-specific helpers separate from the generic player/editor.
3. Supply schema defaults, constraints, finite bounds and optional `.tres` presets.
4. Add deterministic reference coverage where feasible: seeds, parameter extremes, representative timestamps, loop seams and front/back outputs. Document any numerical differences.
5. Verify pause, speed, stop, restart, instance isolation and the appropriate stateful/analytic behavior.
6. Review a normal-speed Godot capture, clipping and layer order; record cold generation and cache cost. An import-only check is not visual acceptance.
7. Update the migration table/roadmap, provenance, documentation and changelog without claiming unverified platforms.

Do not change the public API merely to add an effect name. If a new primitive or simulator is required, discuss its contract and test it separately. Game damage, collision and actor ownership stay outside the visual player.

## Pull requests

Explain the concrete behavior change, source attribution, validation commands/results and remaining limits. Attach a short visual comparison for drawing changes. Keep unrelated refactoring out. Small documentation fixes do not require inventing tests; run relevant checks for code changes and the full gate before release.

Contributions are made under the repository's MIT license. Keep original author notices. No CLA is required.

## Release process

Versions follow SemVer, with explicit changelog notes for breaking changes while 0.x. Update `plugin.cfg`, both changelogs, package version and documentation together. The resource/effect format version is a separate compatibility contract and must not silently change.

Run the full gate, build release ZIPs with `python3 tools/pixelfx/package_demo.py`, check their contents and SHA-256, then create an annotated `vX.Y.Z` tag and GitHub release with the addon/source archives and checksum manifest. Publish only after the tagged commit's CI passes. See `.github/workflows/ci.yml` for the current test environment.
