<!-- docs/workbench-2.md -->

# Workbench 2.x Theme Provenance

## Reference Corpus

The packaged Workbench 2.x theme is an independent Heritage Themes study sequenced after Workbench 1.3 by [ActiveAdmin React Showcase issue #103](https://github.com/scarver2/activeadmin-react-showcase/issues/103). The following references were inspected on September 21, 2026:

- [AmigaOS developer documentation: RKRM Changes and Additions](https://developer.amigaos3.net/sites/default/files/downloads/2024-02/RKRM%20changes%20and%20additions-%282024-02-21%29.pdf), especially the Release 2 pen roles and menu discussion on pages 66 and 98–99. This is the primary technical authority for the pseudo-3D, four-colour grammar.
- [GUIdebook: Workbench 2.04 screenshots](https://guidebookgallery.org/screenshots/amigaos204), used to cross-check windows, preferences, menu, requester, icon, and selected-state relationships across a capture set.
- [Workbench Nostalgia: Release 2.0](https://www.gregdonner.org/workbench/wb_20.html), used for release chronology and a visual cross-check of the blue selection, gray fill/background, black-and-white edge system, GadTools, and reorganized menus.
- [Cloanto / Amiga Forever screenshots](https://www.amigaforever.com/screenshots/), used as the issue-authorized preservation context. Its current public gallery does not expose a focused Workbench 2.x capture set, so it was not treated as the sole visual source.

No screenshot, ROM, font, logo, icon, disk image, pointer, gadget bitmap, or other historical asset is redistributed. All CSS geometry and token values are original work under this repository's MIT license. The modern hexadecimal values are accessible approximations assigned to the documented pen roles; they are not claimed to be a bit-exact palette dump. Workbench is a trademark of Cloanto Corporation; this independent heritage study is not an official product or endorsement.

## Source → Grammar → AA4 Adaptation Ledger

| Historical source | Characteristic design grammar | AA4 / current-platform adaptation |
| --- | --- | --- |
| RKRM Release 2 pen definitions | `TEXTPEN`, `SHINEPEN`, `SHADOWPEN`, `FILLPEN`, `FILLTEXTPEN`, and `BACKGROUNDPEN` give interface elements semantic four-colour roles | CSS custom properties name the roles `text`, `shine`, `shadow`, `fill`, `fill-text`, and `surface`; components consume roles instead of repeating literals |
| RKRM Release 2 menu compatibility | Screen title and menu areas used a dark bar with gray text under the Release 2 pen constraint | The semantic `screen_header` role is a compact black/gray landmark; it does not recreate right-mouse menus or alter AA4 navigation behavior |
| Workbench 2.04 capture set | Gray work surface, raised windows/gadgets, inset wells, compact controls, and blue selections form one restrained pseudo-3D system | CSS border-side shine/shadow geometry distinguishes raised and inset surfaces without images, gradients that imply glass, or ornamental decoration |
| Workbench 2.0 release record | Blue highlight/selection, gray fills, and black/white edges replaced the flat Workbench 1.x language | Workbench 2.x is a separate `:workbench_2` theme and prefix; no Workbench 1.3 selector or byte is mutated |
| Compact bitmap-era typography | Small system text supports dense tools but the original font is proprietary and low-resolution conventions are not accessible defaults | A system monospace fallback stack preserves the technical rhythm at readable modern sizes; no font is embedded |
| Drawer and disk metaphors | Icons are functional objects with simple outlined geometry | `launcher_art` is original CSS geometry owned by the composition, labelled by host text, and is not part of the semantic functional-icon registry |
| Window gadgets and borders | Bevel direction communicates raised, inset, and pressed state | Semantic windows, data regions, controls, and `:active` actions use border direction; decorative fake close/zoom/depth controls are omitted |
| Desktop-first layout | Historical screens assumed desktop input and fixed display modes | Stable slots reflow to one column, data stays locally scrollable, controls retain 44px targets, and source order remains the reading order |
| Fixed historical presentation | Workbench 2.x does not establish a modern automatic dark theme | `color-scheme: light` is fixed in both host modes; no `prefers-color-scheme` variant is invented |
| Pixel-era platform conventions | Original motion, contrast modes, focus indication, and zoom behavior do not meet every current requirement | Explicit focus rings, reduced-motion suppression, forced-colors token substitution, responsive reflow, and semantic host markup remain mandatory |

## Ownership Boundary

The gem owns deterministic presentation source and the same 24 semantic presentation roles established by the Workbench 1.3 contract, independently namespaced as `workbench-2-*`. The host owns HTML semantics, accessible names, routes, authorization, data, forms, search, sorting, mutation, Rails/React integration, and native ActiveAdmin behavior. Requiring the gem has no styling side effect.

The installer writes one application-owned `active_admin_workbench_2.css`. A host must explicitly import it, set `data-activeadmin-theme="workbench-2"`, and apply classes from `Workbench2::COMPOSITION.slots`. The Showcase consumer should prove the installed package on a representative Heritage Laboratory surface with launcher, navigation, data, form/action, status, desktop, and narrow states. Because the historical system defines one fixed presentation, a dark screenshot is not required; the host's dark preference must instead prove that the fixed Workbench presentation is preserved.

—
Stan Carver II
Made in Texas 🤠
https://stancarver.com
