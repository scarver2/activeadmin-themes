<!-- docs/architecture.md -->

# Architecture

Loading the gem exposes metadata and tooling; it never mutates ActiveAdmin configuration or injects assets. The explicit registry records each theme's key, name, description, ActiveAdmin requirement, recipe version, skin, and composition.

`Skin` owns semantic palette/token source. `Composition` owns layout source and named host-applied CSS slots. `Theme` binds one of each to compatibility metadata and composes skin before composition. Every source uses a `StylesheetManifest` with an explicit ordered part list; glob and alphabetical discovery are deliberately absent.

Installation copies one deterministic recipe into a visible application-owned file, reports changes, and stops before overwriting local modifications. Themes own presentation only. ActiveAdmin owns behavior, and `activeadmin-react` remains outside the dependency graph. See [Theme composition architecture](theme-compositions.md).

—
Stan Carver II
Made in Texas 🤠
https://stancarver.com
