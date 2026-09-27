<!-- docs/workbench-13.md -->

# Workbench 1.3 Theme Provenance

## Promoted Design Source

The packaged Workbench 1.3 theme promotes the accepted visual grammar from [ActiveAdmin React Showcase PR #109](https://github.com/scarver2/activeadmin-react-showcase/pull/109). The reviewed study head was `9c630d5b683cf6780e851d3004f7ddf3d8cb4918`; its original CSS implementation source was `3e6f1670630e0690f9e35758c1777e0e3b0626b3`.

That study inspected [Cloanto / Amiga Forever: Workbench 1.3 environment](https://www.amigaforever.com/screenshots/workbench-1-3/) and its linked still image on September 20, 2026. The reference established the blue desktop, white frame lines, white title strips with blue lettering and rules, compact monospaced labels, drawer metaphor, and restrained orange accent.

No historical screenshot, ROM, font, logo, icon, floppy image, Boing Ball, or other artwork is redistributed. The CSS geometry and values are original work under this repository's MIT license. Workbench is a trademark of Cloanto Corporation; this independent heritage study is not an official product or endorsement.

## Historical Reference → AA4 Constraint → Theme Adaptation

| Historical reference | AA4 / current-platform constraint | Workbench 1.3 adaptation |
| --- | --- | --- |
| Blue screen and white framed windows | Hosts retain semantic document structure and native ActiveAdmin capability | Scoped workspace, window, header, and content roles applied by the host |
| White/blue title strips and ruled borders | Decorative controls must not imply unavailable behavior | Window headings use CSS rules with no fake close/resize controls |
| Compact monospaced lettering | Font redistribution and modern readability | System monospace stack at 16px desktop / 14px narrow |
| Four-color vocabulary | Contrast and visible focus remain mandatory | Original `#244b9b`, `#fffdf4`, `#10234e`, `#ffae38` values plus explicit focus treatment |
| Drawer illustrations | Functional icons must keep a governed semantic vocabulary | Original CSS drawer geometry remains composition-owned and visibly labelled |
| Overlapping windows | Predictable reading order, zoom, narrow screens, and touch access | Non-overlapping grid, single-column reflow, 44px interactive controls, local table overflow |
| Requester-style actions | Routes, authorization, data, and mutation belong to the host | Presentation-only form and action roles; no request behavior in the gem |
| Fixed historical palette | Host dark preference must not corrupt the reference | One light presentation in both host modes; no invented dark Workbench |
| Pixel-era conventions | Reduced-motion and forced-colors preferences remain authoritative | No motion and an explicit forced-colors adaptation |

## Ownership Boundary

The gem owns deterministic presentation source and stable semantic class names. It does not own Rails routes, ActiveRecord models, authorization, filters, sorting, mutation, React components, JavaScript state, data attributes used by tests, or ordinary functional icons. Requiring the gem has no styling side effect. The installer writes one application-owned `active_admin_workbench_13.css`; the host explicitly imports it and applies the theme attribute and composition slots.

The Showcase consumer must prove the packaged source on representative desktop and narrow surfaces before this heritage theme is considered integrated. Historical PR #109 screenshots remain design provenance; they are not evidence for the new installed path.

—
Stan Carver II
Made in Texas 🤠
https://stancarver.com
