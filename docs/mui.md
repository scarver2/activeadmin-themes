<!-- docs/mui.md -->

# MUI Theme Provenance

## Dedication

In memory of Ron Dillard of On Video Dallas, a friend of the Amiga and an enthusiastic MUI fan.

## Reference Corpus

The packaged MUI theme is an independent Heritage Themes study sequenced after Workbench 3.x by [ActiveAdmin React Showcase issue #103](https://github.com/scarver2/activeadmin-react-showcase/issues/103). The following references were inspected on September 21, 2026:

- [Magic User Interface public development repository](https://github.com/amiga-mui/muidev), maintained by the MUI project, used as the authoritative current identity and documentation home for MUI on AmigaOS systems.
- [MUI 3.8 release](https://github.com/amiga-mui/muidev/releases/tag/3.8), used to anchor the classic AmigaOS 3.x lineage rather than infer MUI from a later desktop environment.
- [AROS Zune Application Development Manual](https://developers.aros.org/documentation/zune-dev/zune-application-development.html), used as an open, authoritative description of Zune's MUI-compatible object model: font-sensitive layouts, automatic adaptation to window size, semantic GUI construction, and user-controlled look and feel.
- [MUI master API documentation](https://github.com/amiga-mui/muidev/blob/master/files/muimaster.txt), used to cross-check the object, gadget, requester, keyboard-shortcut, and application-level configuration vocabulary.

No MUI archive, logo, font, screenshot, gadget bitmap, background, preference file, or other historical asset is redistributed. The CSS geometry and token values are original work under this repository's MIT license. MUI and Magic User Interface may be trademarks of their respective owners; this independent heritage study is not an official product or endorsement.

## Source → Grammar → AA4 Adaptation Ledger

| Historical source | Characteristic design grammar | AA4 / current-platform adaptation |
| --- | --- | --- |
| MUI and Zune developer documentation | An object-oriented toolkit lets an application describe semantics while the toolkit performs layout | The same 24 Heritage roles remain presentation-only slots; native AA4 markup, routes, authorization, and behavior stay host-owned |
| Zune manual | Layouts are font-sensitive and adapt to window size without hard-coded coordinates | Flexible grids, wrapping registers, intrinsic controls, and narrow reflow replace fixed desktop window coordinates |
| Zune manual | The user controls the GUI look and feel rather than receiving one immutable application skin | All visible values are semantic `--mui-*` custom properties; the packaged silver/teal preset is a deliberate baseline that a host can override without changing selectors |
| MUI object vocabulary | Framed groups, compact registers, lists, string gadgets, buttons, and nested application objects create hierarchy | Rounded-but-compact group frames, recessed data/field areas, register-like navigation, and raised action objects distinguish MUI from Workbench chrome |
| MUI object model | Application interfaces are composed from reusable classes rather than painted desktop objects | Launchers are framed application objects, not Workbench disk/drawer imitations; the original CSS illustration is decorative and separately labeled by host text |
| MUI requester and gadget documentation | Keyboard access and explicit actions are part of the toolkit vocabulary | Native buttons, links, selects, and summaries retain semantics, 44px targets, visible focus, and host-owned accessible names |
| Historical user configurability | MUI preferences could vary extensively per user and application | The theme does not claim one canonical historic palette or copy a third-party preset; it demonstrates the configurability principle with an original baseline |
| Current accessibility requirements | Historical focus, contrast, motion, and fixed-screen assumptions do not fully meet current needs | Forced-colors tokens, reduced-motion suppression, local table overflow, responsive source order, and modern contrast are intentional adaptations |

## Lineage Boundary

MUI is an application GUI toolkit theme, not Workbench 3.x with softer corners. It shares the stable Heritage contract only so identical host semantics can prove a genuinely different composition. MUI's defining characteristics here are semantic object groups, font-sensitive adaptive layout, register-like navigation, recessed fields, raised gadgets, and user-overridable presentation tokens. It does not import Workbench CSS, claim a canonical third-party MUI preference preset, recreate MUI runtime behavior, or reproduce proprietary artwork.

AROS/Zune remains a later independent Heritage theme even though its open documentation helps explain MUI-compatible concepts. This theme does not treat Zune's modern visual defaults as historical MUI defaults.

## Ownership Boundary

The gem owns deterministic presentation source and the shared 24 semantic roles, independently namespaced as `mui-*`. The host owns semantic HTML, accessible names, data, routes, authorization, forms, sorting, mutation, keyboard behavior, Rails/React integration, and native ActiveAdmin behavior. Requiring the gem has no styling side effect.

The installer writes one application-owned `active_admin_mui.css`. A host must explicitly import it, set `data-activeadmin-theme="mui"`, and apply classes from `Mui::COMPOSITION.slots`. A Showcase consumer should prove the installed package on a representative operations surface at desktop and narrow widths and should demonstrate a bounded token override without changing the composition contract. The packaged baseline is intentionally light and does not invent an automatic dark preset; forced-colors remains user-controlled.

—
Stan Carver II
Made in Texas 🤠
https://stancarver.com
