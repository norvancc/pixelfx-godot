# Roadmap and migration status

This roadmap describes intended work, not promised dates or completed features.

| Area | Status in 0.2.0 |
| --- | --- |
| Generic effect API, preset resources, player lifecycle | Implemented and locally tested |
| Editor discovery, preview, parameter editing and saving | Implemented and locally tested |
| Layering, frame sharing, prewarming, player pool | Implemented and locally tested |
| Fire / Fireball | Ported; upstream pixel comparison included |
| Arcane Fireball | Alternate preset of Fireball |
| Ice / Ice lance | Ported; full-cycle comparison included |
| Projectiles / Laser bolt | Ported; full-cycle comparison included |
| Holy / Sunburst | Ported; full-cycle comparison included |
| Water / Ripples | Ported with back/front layers; full-cycle comparison included |
| Other 239 upstream effects | Not ported |
| Upstream actor / rig / act / poses systems | Not ported |
| Dedicated sim / chain helpers | Not fully ported; add as effects require |
| GPU / native accelerated backend | Not implemented |
| Mobile, Web and additional renderers | Not validated |

Next priorities:

1. Extend beyond the five looping ports to representative one-shot and stateful effects.
2. Add category helpers once, retain provenance, and extend reference tests for each effect.
3. Validate parameter extremes, timings and normal-speed visual output before expanding the catalog.
4. Profile cold generation and unique-parameter workloads; add backend optimization only with measurements.
5. Broaden platform/version CI and publish an explicit compatibility matrix.

Adding a catalog entry means the effect works through the public API and has documented verification. It does not imply identical pixels, perfect visual quality or untested platform support.
