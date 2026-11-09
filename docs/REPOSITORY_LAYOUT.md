# Repository layout

The repository is both an installable Godot addon and a runnable demonstration project. Keep published resource paths stable: moving a script or preset can break downstream `res://` references.

| Path | Purpose |
| --- | --- |
| `addons/pixelfx/` | Distributable addon: runtime, editor, 31 effects / 32 presets, templates, API/catalog/validation documentation, license and provenance |
| `demos/pixelfx/` | Runnable gallery and integration examples |
| `tests/pixelfx/` | Rendering, runtime, catalog and editor verification; test fixtures stay here |
| `tools/pixelfx/` | Reference generation, validation and release packaging tools |
| `tools/pixelfx/release/` | Standalone release configuration templates used by packaging; not a second development project |
| `scripts/macos/` | Optional Finder launchers; resolve the project root relative to the script |
| `docs/` | Contributor documentation, repository conventions and documentation index |
| `docs/plans/` | Full migration plan and batch dependency/acceptance reviews; completed status must cite the ledger and acceptance evidence |
| `docs/images/` | Public documentation illustrations |
| `.github/` | CI, issue and pull request templates, ownership and dependency configuration |
| `builds/` | Ignored generated references, reports, recordings, exports and release archives |
| `local/` | Ignored private work history and scratch files; excluded from Godot scanning and release archives |
| `.godot/` | Ignored Godot import/editor cache |

Root files provide installation, licensing, contributor policies, release history and the runnable Godot project. Keep detailed design notes in `docs/`; keep personal transcripts out of public documentation. The existing work transcript is preserved locally as `local/history.md`.

## Migration evidence

`docs/migration-status.json` tracks all 244 pinned upstream algorithms (31 completed, 213 remaining; B2 has 29 remaining). `addons/pixelfx/validation/b1.json` and `b2.json` bind batch acceptance to implementation hashes. `addons/pixelfx/docs/CATALOG.md` stays inside the addon so preset paths and lifecycle capabilities remain available after addon-only installation. Public posters live in `docs/images/`; large recordings, decoded frames and generated CI reports stay under ignored `builds/`, with shareable evidence links in the review documents.

Source batch progress does not change the published version: 0.2.0 still contains five effects. Keep both changelogs and package/version metadata aligned when a new release is actually prepared.

## Change rules

- Keep engine-facing `.gd.uid` and resource import descriptors with their tracked resources. Do not confuse these with the generated `.godot/` cache.
- Keep addon documentation and attribution inside the addon; repository-level policies remain at the root for standard hosting discovery.
- Keep generated binaries, logs, upstream checkouts, credentials and private histories out of Git and published archives.
- Update links and release packaging when moving repository support files. Do not reorganize runtime resources solely for visual symmetry.
- New top-level directories need a clear ownership boundary. Prefer existing directories to generic miscellaneous folders.

## Verification

Run `python3 tools/pixelfx/package_demo.py` after packaging changes and inspect both ZIPs. Run `python3 tools/pixelfx/check.py` for runtime or resource changes. Packaging must retain working relative launcher paths and the standalone documentation, while the addon archive contains only `addons/pixelfx/`.
