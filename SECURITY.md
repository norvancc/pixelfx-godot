# Security policy

## Supported versions

Security fixes are provided for the latest published release, currently **0.2.0**. Older releases and prerelease snapshots are unsupported. The `main` branch also contains unreleased B1/B2 ports; include the exact source commit when reporting an issue from a checkout.

## Reporting

Do not publish exploit details, credentials or private project files in a public issue. Use GitHub's private vulnerability reporting from the repository's **Security → Report a vulnerability** page when available. If unavailable, ask for a private reporting channel in an issue without including vulnerability details.

Include the affected version, Godot version/platform, reproduction steps, impact and a minimal sanitized project. No response-time SLA is promised for this independently maintained project.

## Trust boundary

Effect modules and presets referencing GDScript are executable code, including `@tool` code inside the editor. Parameter validation is not a sandbox. Install third-party effects only from sources you trust. Runtime loading of arbitrary user-provided scripts is outside this library's scope.

The development parity check downloads a pinned upstream checkout and executes its JavaScript reference renderer after verifying recorded source hashes. This is development tooling, not a game runtime dependency.
