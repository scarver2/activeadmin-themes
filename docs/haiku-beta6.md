<!-- docs/haiku-beta6.md -->

# Haiku R1/beta6 Theme Provenance

## Canonical Reference

This independent Heritage Themes study follows the approved sequence in [ActiveAdmin React Showcase issue #103](https://github.com/scarver2/activeadmin-react-showcase/issues/103). It targets Haiku R1/beta6, not a generic BeOS recollection and not an Amiga-derived toolkit. The following primary sources were inspected on September 21, 2026:

- [Haiku R1/beta6 source branch at exact head `71647cf04f5c86a29cb09947e2cc3f13b3f19da1`](https://github.com/haiku/haiku/tree/71647cf04f5c86a29cb09947e2cc3f13b3f19da1), which fixes the source provenance for this study.
- [Haiku repository overview](https://github.com/haiku/haiku/tree/71647cf04f5c86a29cb09947e2cc3f13b3f19da1), used for the project's stated goals of sensible defaults, clean and concise design, and a unified desktop environment.
- [`InterfaceDefs.cpp` beta6 default colors](https://github.com/haiku/haiku/blob/71647cf04f5c86a29cb09947e2cc3f13b3f19da1/src/kits/interface/InterfaceDefs.cpp), used for the canonical blue desktop, gray panel, white document, gray control, yellow window-tab, blue keyboard-navigation, border, and highlight values.
- [`DefaultDecorator.cpp` beta6 decorator source](https://github.com/haiku/haiku/blob/71647cf04f5c86a29cb09947e2cc3f13b3f19da1/src/servers/app/decorator/DefaultDecorator.cpp), whose source description explicitly identifies the default decorator with yellow tabs.
- [`HaikuControlLook.cpp` beta6 control-look source](https://github.com/haiku/haiku/blob/71647cf04f5c86a29cb09947e2cc3f13b3f19da1/src/kits/interface/HaikuControlLook.cpp), used to distinguish reusable control presentation from window decoration.
- [Official Haiku GUI guide](https://i18n.haiku-os.org/userguide/data/export/docs/userguide/en/gui.html), used for the partial-width yellow tab, window borders, and Stack & Tile explanation. This recipe translates the visual hierarchy only; it does not imitate those window-manager interactions.
- [Official Appearance preferences guide](https://i18n.haiku-os.org/userguide/data/export/docs/userguide/en/preferences/appearance.html), used for the documented gray panel, blue progress/focus, iconic yellow tab, and automatically derived secondary-color model.
- [Haiku source license inventory](https://github.com/haiku/haiku/blob/71647cf04f5c86a29cb09947e2cc3f13b3f19da1/License.md), used to record that most Haiku-authored source is MIT-licensed while individual components may carry other licenses.
- [Official community companion for the August 26, 2026 beta6 release announcement](https://discuss.haiku-os.org/t/haiku-r1-beta6-has-been-released-haiku-project/19774), used to confirm the named release boundary.

The recipe's CSS, geometry, launcher illustration, responsive rules, and adaptations are original work under this repository's MIT license. No Haiku source, HVIF icon, screenshot, bitmap, font, leaf mark, product logo, or other upstream asset is copied or packaged. Haiku and related marks belong to their respective owners; this is not an official Haiku product or endorsement.

## Historical Reference → AA4 Constraint → Theme Adaptation

| Historical reference | Characteristic grammar | ActiveAdmin 4 adaptation |
| --- | --- | --- |
| Beta6 `InterfaceDefs.cpp` | `#336698` desktop, `#d8d8d8` panel, `#dedede` controls, `#ffffff` documents, `#ffcb00` tabs, `#0000e5` keyboard navigation, and `#6698cb` control highlight | Exact reference values become scoped semantic tokens; derived shadows and text values remain implementation details rather than claimed upstream constants |
| Default decorator and GUI guide | A compact yellow tab identifies the active window without consuming a full-width title bar | Primary and wide host regions receive partial-width yellow headers; no fake close, zoom, drag, tile, or stacking behavior is introduced |
| Appearance preferences | A small primary palette drives automatically derived secondary UI colors | The fixed review baseline derives depth and hover colors through CSS while keeping every visible value host-overridable |
| Haiku repository goals | Sensible defaults and a clean, clear, unified desktop | Dense data, forms, launchers, and navigation use restrained utility geometry rather than ornamental nostalgia |
| Tracker-era desktop grammar | Documents sit in framed windows on a blue desktop and use compact list-oriented controls | The workspace retains source-order semantics, local table overflow, intrinsic grids, and one-column narrow reflow instead of fixed desktop coordinates |
| Current accessibility requirements | Historical pointer targets and color-only focus or selection are insufficient | The adaptation keeps 44px actions, explicit keyboard focus, bordered status states, responsive reflow, reduced motion, and forced-colors support |

## Lineage Boundary

Haiku beta6 is not another Amiga or MUI/Zune skin. It shares the stable 24-role Heritage contract because those roles describe host meaning. Its presentation is independently composed from a blue desktop, light gray control surfaces, white document wells, clean list geometry, and the iconic yellow partial-width active tab. It does not import or alias Workbench, MUI, AmigaOS 4, or AROS/Zune CSS.

The packaged baseline deliberately preserves beta6's canonical yellow-tab light grammar. Although beta6 source contains dark color variants and the operating system exposes appearance preferences, this focused recipe does not invent an automatic historical dark preset. Hosts can override the semantic tokens explicitly; forced colors remains user-controlled.

## Ownership Boundary

The gem owns deterministic presentation source and the shared 24 semantic roles under the independent `haiku-beta6-*` namespace. The host owns semantic HTML, accessible names, data, routes, authorization, form submission, sorting, mutation, keyboard behavior, Rails/React integration, and native ActiveAdmin behavior. Requiring the gem has no styling side effect.

The installer writes one application-owned `active_admin_haiku_beta6.css`. A host must explicitly import it, set `data-activeadmin-theme="haiku_beta6"`, and apply classes from `HaikuBeta6::COMPOSITION.slots`. Showcase must later prove the installed package on a representative operations surface at desktop and narrow widths before this theme is promoted.

—
Stan Carver II
Made in Texas 🤠
https://stancarver.com
