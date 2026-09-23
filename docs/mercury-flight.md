<!-- docs/mercury-flight.md -->

# Mercury Flight Heritage Theme Provenance

## Canonical Reference

This independent Heritage Themes study follows the Mercury Flight addition to
[ActiveAdmin React Showcase issue #103](https://github.com/scarver2/activeadmin-react-showcase/issues/103#issuecomment-5752319209).
Its primary reference corpus is Sheriff's preserved local Mercury Flight Rails
theme under `Projects/Mercury Flight/2026/theme`, inspected on September 22,
2026. The corpus supplies direct evidence of the original product's campaign
operations hierarchy rather than a reconstruction from generic web imagery.

The inspected reference files include:

- `app/assets/stylesheets/theme.scss`, SHA-256
  `700106a0b6236aa4b16a1d1e6a24fedac49d4713ebc54ec5c632489ec4ec911c`;
- `app/assets/stylesheets/foundation_and_overrides.scss`, SHA-256
  `8789ceeab9153d09b39e4dc476e60ea4d02efd31f9e8d26d73185f154c044ca3`;
- `app/views/pages/index.html.haml`, SHA-256
  `e201bbdc5fd0bf82515a5f43654e8f869d8a74338a97f650aba9caa5cf6eb8fc`;
- the original navigation, account, side-navigation, and campaign-table partials;
- `main-bg-grad.jpg`, `nav-logo.png`, and `helmet-sm.png`, used only as
  non-redistributed visual references.

No author, copyright, or public redistribution license was present in the
preserved corpus. Local possession therefore does not establish OSS reuse
rights. The original images, fonts, icon font, compiled CSS, SCSS, markup,
names, data, and JavaScript remain reference-only and are not packaged here.
The theme uses original CSS geometry, system fonts, and no external assets.

## Original Reference → Characteristic Rules → AA4 Adaptation

| Original reference | Characteristic design rules | ActiveAdmin 4 adaptation |
| --- | --- | --- |
| Oxblood textured page background with white content rows | Warm, tactile frame around a precise work surface | Original layered CSS texture surrounds a paper-white application canvas without copying the JPEG |
| Coral wordmark and compact charcoal top navigation | High-confidence identity and a short horizontal capability bar | Condensed system typography, coral identity text, and a responsive route navigation preserve hierarchy without copying the logo |
| Campaign list with salmon header, compact metrics, and row actions | Dense operational table is the primary work surface | Rails-owned records, sorting/filtering links, statuses, and actions receive compact high-contrast table treatment |
| Account summary plus tutorials, tools, and recent campaigns | Global context and contextual support remain visible but secondary | A bounded support window accompanies the primary data surface and stacks below it responsively |
| Small notification counter and direct action controls | Exceptions and next actions are obvious without dashboard ornament | Semantic status tags and restrained coral actions reinforce text and shape, never color alone |
| Foundation-era off-canvas navigation | Narrow layouts preserve access to the same capabilities | Host-owned AA4 navigation behavior remains authoritative; the composition only changes presentation and reflow |

## Design Grammar

Mercury Flight is a campaign-operations product lineage, not an operating-system
desktop theme. Its grammar is a warm oxblood surround, clean paper workspace,
charcoal utility navigation, condensed coral identity, salmon data headers,
compact campaign metrics, and direct controls. It deliberately avoids generic
retro-computing chrome, decorative aviation gauges, faux-metal panels, and the
Amiga/Haiku/Video Toaster vocabularies represented by sibling themes.

The original Voltaire webfont is not redistributed. A readable condensed system
stack carries the same identity role while body copy remains a standard system
sans. The original helmet/wing marks are not copied. The small launcher motif is
new CSS geometry representing direction and motion, not a recreation of either
source image.

## Ownership Boundary

The gem owns deterministic presentation source and the shared 24 semantic roles
under the independent `mercury-flight-*` namespace. The host owns semantic HTML,
accessible names, records, routes, authorization, filtering, form submission,
keyboard behavior, Rails/React integration, and native ActiveAdmin behavior.
Requiring the gem has no styling side effect.

The installer writes one application-owned `active_admin_mercury_flight.css`.
A host must explicitly import it, set
`data-activeadmin-theme="mercury_flight"`, and apply classes from
`MercuryFlight::COMPOSITION.slots`. Showcase must prove the installed package on
a representative campaign/data surface at desktop and narrow widths before the
theme is promoted.

—
Stan Carver II
Made in Texas 🤠
https://stancarver.com
