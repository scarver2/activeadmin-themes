<!-- docs/workbench-3.md -->

# Workbench 3.x Theme Provenance

## Reference Corpus

The packaged Workbench 3.x theme is an independent Heritage Themes study sequenced after Workbench 2.x by [ActiveAdmin React Showcase issue #103](https://github.com/scarver2/activeadmin-react-showcase/issues/103). The following references were inspected on September 21, 2026:

- [Commodore AmigaOS 3.1 Workbench User's Guide](https://www.vht-dk.dk/amiga/diverse/pdf/Commodore_Amiga_OS_3.1_Workbench.pdf), copyright 1993, especially the Workbench, Palette, ScreenMode, and WBPattern preference descriptions. This is the primary period authority for the configurable screen/window backgrounds and AGA-aware presentation.
- [Cloanto: Amiga Forever Workbench 3.1 improvements](https://www.amigaforever.com/kb/16-120), used for provenance and the explicit distinction between the last Commodore/Amiga 3.1 release and Amiga Forever's later, enhanced Workbench 3.X environment.
- [AmigaOS documentation: Workbench Preferences](https://wiki.amigaos.net/wiki/AmigaOS_Manual:_Workbench_Preferences), used to cross-check screen title, icon, and Workbench behavior.
- [AmigaOS documentation: Workbench Pattern Preferences](https://wiki.amigaos.net/wiki/AmigaOS_Manual:_Workbench_Pattern_Preferences), used to confirm that Workbench, window, and screen backgrounds were separately configurable surfaces.
- [Workbench 3.1 running on an emulated Amiga 1200](https://commons.wikimedia.org/wiki/File:Amiga_Workbench_3.1_screenshot.png), a user-created screenshot available under CC BY-SA 4.0/GFDL, used to cross-check the stock four-colour active-window, screen-title, dither, and bevel relationships.
- [Amiga Forever Workbench 3.X screenshot](https://www.amigaforever.com/screenshots/workbench-3-x/), inspected only as a post-Commodore comparison. Its added 3.X features are deliberately not treated as stock 3.1 grammar.

No screenshot, ROM, font, logo, icon, disk image, pointer, gadget bitmap, pattern, or other historical asset is redistributed. All CSS geometry and modern token values are original work under this repository's MIT license. The hexadecimal colors are accessible approximations, not a bit-exact palette dump. Workbench is a trademark of Cloanto Corporation; this independent heritage study is not an official product or endorsement.

## Source → Grammar → AA4 Adaptation Ledger

| Historical source | Characteristic design grammar | AA4 / current-platform adaptation |
| --- | --- | --- |
| Commodore 3.1 manual, Workbench and Palette preferences | Late-Commodore Workbench retains the semantic black, white, gray, and blue system while supporting richer AGA-era display configuration | A fixed slate, surface, shine, shadow, and active-blue token set preserves the recognizable stock relationship without claiming hardware-exact colors |
| Commodore 3.1 manual, WBPattern preferences | Workbench, windows, and screens can have distinct pattern/background treatment | An original two-tone CSS dither marks the desktop only; windows remain solid and readable, and no historical pattern file is copied |
| Licensed stock 3.1 capture | A white screen-information strip sits above the work area; blue identifies the active window while inactive windows stay gray | `screen_header` becomes a compact white landmark; primary/wide window headers use the active-blue role, while secondary windows remain inactive gray |
| Licensed stock 3.1 capture | Active title bars and scroll areas use fine repeated rules within a restrained bevel frame | Original repeating CSS rules create the title treatment; no gadget bitmap, fake close control, scrollbar behavior, or pointer is recreated |
| Commodore Workbench object language | Drawers, disks, tools, and projects remain the functional desktop vocabulary | `launcher_art` uses original CSS geometry, is decorative beside host-owned text, and remains separate from the semantic functional-icon registry |
| Cloanto preservation record | Original Workbench 3.1 and enhanced Workbench 3.X are different environments | The theme excludes NewIcons, FullPalette, third-party utilities, post-Commodore chrome, and other 3.X additions unless a later independent theme authorizes them |
| Historical compact typography | Bitmap-era system text creates dense technical rhythm but the original fonts and raster assumptions are unsuitable redistribution/defaults | A system monospace fallback stack preserves rhythm at accessible modern sizes; no font is embedded |
| Desktop-first platform | The stock interface assumes pointer-driven fixed displays and can place windows freely | The same 24 stable semantic slots reflow to one column, tables scroll locally, source order remains reading order, and controls retain 44px targets |
| Fixed historical presentation | Stock Workbench 3.1 does not define a modern automatic dark theme | `color-scheme: light` is fixed in every host preference; no `prefers-color-scheme` variant is invented |
| Current accessibility requirements | Historical motion, focus, zoom, and contrast conventions do not satisfy every current platform need | Explicit focus rings, reduced-motion suppression, forced-colors substitution, responsive reflow, semantic host markup, and native AA4 behavior remain mandatory |

## Lineage Boundary

Workbench 3.x inherits the general pseudo-3D pen grammar introduced in Workbench 2.x, but is not an alias or recolor. The dithered late-Commodore workspace, white screen-information bar, active-blue window hierarchy, and denser ruled headers define this study. It deliberately excludes MUI's application-level configurability and object vocabulary, MagicWB/NewIcons artwork, and Amiga Forever 3.X enhancements. Those lineages require separate evidence and independent themes.

## Ownership Boundary

The gem owns deterministic presentation source and the same 24 semantic roles used by the earlier Workbench contracts, independently namespaced as `workbench-3-*`. The host owns HTML semantics, accessible names, routes, authorization, data, forms, search, sorting, mutation, Rails/React integration, and native ActiveAdmin behavior. Requiring the gem has no styling side effect.

The installer writes one application-owned `active_admin_workbench_3.css`. A host must explicitly import it, set `data-activeadmin-theme="workbench-3"`, and apply classes from `Workbench3::COMPOSITION.slots`. The Showcase consumer should prove the installed package on a representative late-Commodore operations surface with launcher, active/inactive windows, navigation, data, form/action, status, desktop, and narrow states. Because the historical system defines one fixed presentation, a dark screenshot is not required; the host's dark preference must instead prove that this fixed Workbench presentation remains unchanged.

—
Stan Carver II
Made in Texas 🤠
https://stancarver.com
