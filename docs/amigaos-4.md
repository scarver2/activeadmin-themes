<!-- docs/amigaos-4.md -->

# AmigaOS 4 Theme Provenance

## Canonical Reference

The packaged theme is an independent AmigaOS 4.1 Final Edition–inspired Heritage Themes study sequenced after MUI by [ActiveAdmin React Showcase issue #103](https://github.com/scarver2/activeadmin-react-showcase/issues/103). Final Edition is the visual-era anchor; “AmigaOS 4” is the shorter catalog name. The following official sources were inspected on September 21, 2026:

- [AmigaOS 4.1 Final Edition announcement](https://www.hyperion-entertainment.com/index.php/news/36-amigaos-4x/157-amigaos-41-final-edition) and [official What's New page](https://www.amigaos.net/content/2/what%E2%80%99s-new), used to bound the study to the 2014 standalone Final Edition and to identify its new installation graphics, icons, and backdrops by Martin Merz. Those works are reference material only and are not redistributed or traced.
- [Official AmigaOS Features](https://amigaos.net/content/1/features), used for Workbench, AmiDock, instant system themes, anti-aliased fonts, scalable true-color icons, composited shadows, and user-adjustable transparency.
- [Programming AmigaOS 4: GUI Toolkit ReAction](https://wiki.amigaos.net/wiki/Programming_AmigaOS_4%3A_GUI_Toolkit_ReAction), used for ReAction's automatic layout, nested horizontal and vertical groups, keyboard shortcuts, BubbleHelp, and system-configurable edges, frame thickness, and color schemes.
- [Programming in the Amiga Environment](https://wiki.amigaos.net/wiki/Programming_in_the_Amiga_Environment), used to cross-check Release 4.1 as library version 53 and the system-provided interface vocabulary.
- [Screen Programming](https://wiki.amigaos.net/wiki/Screen_Programming), used for AmigaOS 4.x's preference for adaptable application windows sharing the public Workbench screen.
- [UI Style Guide: Workbench](https://wiki.amigaos.net/wiki/UI_Style_Guide_Workbench), used for coherent upper-front lighting, harmonized palettes, simple symbolism, gradients, and visibly distinct selection states. Its explicit direction to avoid the Boing Ball is preserved.
- [UI Style Guide: Basics](https://wiki.amigaos.net/wiki/UI_Style_Guide_Basics), [Windows and Requesters](https://wiki.amigaos.net/wiki/UI_Style_Guide_Windows_and_Requesters), and [Gadgets](https://wiki.amigaos.net/wiki/UI_Style_Guide_Gadgets), used for enduring interaction grammar: upper-left lighting, raised actions, recessed display regions, immediate pressed feedback, logical groups, concise labels, and resizable interfaces.
- [Workbench Prefs](https://wiki.amigaos.net/wiki/Workbench/Prefs), used to confirm that GUI, font, palette, pointer, screen, pattern, and Workbench presentation are intentionally user configurable.
- [Official AmigaOS history](https://www.amigaos.net/content/10/history-amigaos), used to keep AmigaOS 4.0, 4.1, and 4.1 Final Edition distinct from classic Workbench releases.

The AmigaOS Documentation Wiki states that its text, graphics, sounds, demonstrations, patches, and files are protected or presented by permission. No screenshot, icon, backdrop, font, wordmark, title-bar glyph, installer art, or other AmigaOS asset is packaged. The CSS geometry, palette, gradients, and states are original work under this repository's MIT license. Amiga, AmigaOS, Workbench, ReAction, and related marks may belong to their respective owners; this independent study is not an official product or endorsement.

## Source → Grammar → AA4 Adaptation Ledger

| Historical reference | Characteristic design grammar | AA4 / current-platform adaptation |
| --- | --- | --- |
| AmigaOS 4.1 Final Edition | A high-color, modernized Workbench generation rather than another low-color classic release | Cool blue, pearl, and graphite original tokens distinguish the theme from Workbench 1.3/2.x/3.x without claiming universal canonical hex values |
| Official Features | Workbench, launchers, system themes, true-color presentation, anti-aliased text, shadows, and optional transparency | A composited CSS desktop, compact window shadows, and polished controls evoke the capability without bundling images, fonts, wallpaper, or runtime effects |
| ReAction guide | Nested objects lay themselves out automatically and users can configure rounded/angular edges, frame thickness, and color | The shared 24 roles use intrinsic grids, wrapping controls, responsive reflow, semantic tokens, and a documented stock-feeling baseline rather than fixed desktop coordinates |
| ReAction guide | Application gadgets, keyboard access, BubbleHelp, and explicit action feedback remain part of the interface contract | Native links, buttons, selects, and summaries retain host behavior, accessible names, keyboard operation, visible focus, and 44px targets |
| Workbench icon guide | Simple symbols share an upper-front light source, harmonized color, and strong selected states | Original CSS-only launcher geometry uses consistent light and depth; textual labels carry meaning, and selected/hover states remain non-color-only |
| UI style guide | Raised objects imply action, recessed objects imply display, and pressed controls visibly reverse depth | Buttons, window chrome, fields, and data wells use restrained highlight/shadow cues with explicit focus and pressed feedback |
| Screen Programming | Modern applications generally share the public Workbench screen and adapt to available space | One continuous workspace contains independently framed application regions and collapses to source order at narrow widths |
| Workbench preferences | System presentation is intentionally configurable | Every visible value is a semantic `--amigaos-4-*` custom property; hosts may override tokens without changing selectors or composition roles |
| Current accessibility requirements | Historical translucency, contrast, focus, pointer sizing, and fixed-screen assumptions are insufficient on their own | Strong focus rings, readable contrast, local table overflow, responsive reflow, reduced-motion suppression, and forced-colors tokens are intentional adaptations |

## Lineage Boundary

This is not a fourth classic Workbench palette and not MUI with a blue skin. The theme targets the stock-feeling AmigaOS 4.1 Final Edition era: smoother high-color surfaces, composited depth, polished ReAction controls, clear active-window blue, compact utility density, and adaptable shared-screen layout. It explicitly excludes Workbench 1.3/2.x/3.x low-color palettes and pixel fonts; MUI and AROS/Zune toolkit styling; MagicWB, NewIcons, AmiKit, Amiga Forever, community themes, third-party PNG icon packs, wallpapers, and user-customized screenshots as canonical references.

The packaged presentation also excludes proprietary Martin Merz icons and backdrops, Amiga/AmigaOS wordmarks, title-bar glyphs, the Boing Ball, and photocopied system controls. Rounded frames, modest gradients, and shadows are original CSS adaptations, not a pixel-perfect reproduction. A fixed light baseline makes visual review deterministic even though the actual operating system is extensively configurable; no unsupported automatic historical dark preset is invented.

## Ownership Boundary

The gem owns deterministic presentation source and the same shared 24 semantic roles used by other Heritage themes, independently namespaced as `amigaos-4-*`. The host owns semantic HTML, accessible names, data, routes, authorization, forms, sorting, mutation, keyboard behavior, Rails/React integration, and native ActiveAdmin behavior. Requiring the gem has no styling side effect.

The installer writes one application-owned `active_admin_amigaos_4.css`. A host must explicitly import it, set `data-activeadmin-theme="amigaos_4"`, and apply classes from `AmigaOS4::COMPOSITION.slots`. A Showcase consumer must prove the installed package on a representative operations surface at desktop and narrow widths before the theme is generalized or promoted.

—
Stan Carver II
Made in Texas 🤠
https://stancarver.com
