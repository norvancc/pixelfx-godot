# Ahead-of-time GDScript generation

Run `node tools/pixelfx/codegen/generate.mjs /absolute/path/to/pinned/upstream` from the repository. The input must be PixelFX 0.3.0 at `a84159688af3ca37a4be05a0d422b94451b2e24e`.

The generator emits executable GDScript functions and native resource wrappers. Godot runs the emitted GDScript with `native/semantics.gd` support; it never parses JavaScript or executes a JS VM. Acorn is build-only; its MIT license is retained in `ACORN-LICENSE`.

`native/catalog.json` fixes the 192 new public entries. Existing 52 accepted effects remain handwritten and are never overwritten. `native/sources.json` retains the exact upstream source hashes. Generated dependencies also include copies of previously ported effects because upstream chain modules import those modules as their original API; these copies are internal dependencies and do not count as additional algorithms.

After generation run the basic native check with `python3 tools/pixelfx/basic_check.py`. This checks module/parameter loading and sampled default playback, and writes a source-hashed report with `full_acceptance=false`. It intentionally does not run unit tests, pixel comparisons, or video recording. Full acceptance remains a later phase.
