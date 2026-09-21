<!-- docs/aros-zune.md -->

# AROS/Zune Theme Provenance

## Canonical Reference

The packaged theme is an independent AROS/Zune Heritage Themes study sequenced after AmigaOS 4 by [ActiveAdmin React Showcase issue #103](https://github.com/scarver2/activeadmin-react-showcase/issues/103). AROS supplies the open-source operating-system lineage and Zune supplies the application-object grammar. The following primary sources were inspected on September 21, 2026:

- [AROS Zune Application Development Manual](https://developers.aros.org/documentation/zune-dev/zune-application-development.html), used for Zune's object-oriented design, MUI API and look-and-feel compatibility, font-sensitive automatic layout, window-size adaptation, semantic GUI construction, and user-owned presentation settings.
- [Official AROS source repository](https://github.com/aros-development-team/AROS), used to establish the actively developed open-source system boundary and locate the Zune implementation, preferences editor, tutorial applications, and theme configuration.
- [Zune `muimaster` source hierarchy](https://github.com/aros-development-team/AROS/tree/master/workbench/libs/muimaster) and [Zune Preferences source hierarchy](https://github.com/aros-development-team/AROS/tree/master/workbench/prefs/Zune), used to identify the breadth of object classes and the independently configurable system, window, group, frame, navigation, button, cycle, list-view, scrollbar, slider, string, and special-object surfaces.
- [AROS Default Zune preferences](https://github.com/aros-development-team/AROS/blob/master/images/Themes/AROSDefault/Env-Archive/Zune/global.prefs), used as a tonal reference for warm neutral objects, blue selection/framing, adjustable fonts, object backgrounds, and highlight/shadow relationships. The binary preferences file is not redistributed or parsed at runtime.
- [Official AROS screenshot archive](https://www.aros.org/pictures/screenshots/), used to cross-check Zune's visible skinning range, preference editor, adaptive test applications, and integration with the Wanderer desktop. Screenshots and icon artwork are reference material only.
- [AROS Public License 1.1](https://github.com/aros-development-team/AROS/blob/master/LICENSE), used to document the upstream source and asset license boundary. No APL-covered source or asset is copied into this MIT-licensed recipe.
- [Official 2002 AROS archive note](https://aros.sourceforge.io/news/archive/2002.html), used to preserve the project's explicit clean-implementation history and distinguish the present Zune study from redistributed MUI materials.

The CSS, palette adaptation, geometry, gradients, dither, states, and launcher illustration are original work under this repository's MIT license. No AROS source, binary preference file, screenshot, icon, font, background, logo, product mark, or Zune/MUI runtime resource is packaged. AROS, Zune, MUI, Wanderer, and related marks may belong to their respective owners; this independent study is not an official product or endorsement.

## Source → Grammar → AA4 Adaptation Ledger

| Historical reference | Characteristic design grammar | AA4 / current-platform adaptation |
| --- | --- | --- |
| Zune development manual | Applications specify semantic object relationships while the toolkit performs font-sensitive, window-sensitive layout | The shared 24 semantic roles use intrinsic grids, wrapping groups, and source-order narrow reflow instead of fixed desktop coordinates |
| Zune development manual | Users choose the concrete look and feel independently from application semantics | All visible values are `--aros-zune-*` tokens; hosts may replace the bundled baseline without altering roles or selectors |
| AROS Default preferences | Warm neutral object surfaces, blue active framing, dimensional highlights and shadows, and adjustable fonts | Original cream, amber, and blue CSS tokens establish a deterministic review baseline without claiming one immutable AROS palette |
| Zune Preferences source | System, window, group, frame, navigation, button, list, scrollbar, string, and special-object presentation are separate configurable concerns | Explicit recipe concerns preserve cascade reviewability while the stable composition contract keeps application markup independent of visual tuning |
| `muimaster` source hierarchy | Groups, registers, lists, strings, gauges, balance objects, custom classes, and notifications form a composable object toolkit | Navigation, window groups, data wells, forms, status objects, and launchers share one coherent beveled object language without recreating native classes or behavior |
| Official screenshot archive | Zune supports radically different skins and remains integrated with AROS's Wanderer environment | This recipe presents one restrained AROS Default–inspired baseline, not a universal or pixel-perfect Zune appearance |
| Current accessibility requirements | Historical pointer size, focus visibility, contrast, fixed-screen assumptions, and ornamental texture are insufficient by themselves | Native controls retain accessible names and semantics; the adaptation adds visible focus, 44px action targets, local overflow, responsive reflow, reduced motion, and forced colors |

## Lineage Boundary

AROS/Zune is related to MUI at the API and toolkit-concept level, but it is not the packaged MUI theme with a new palette. MUI's recipe uses a silver/teal configurable application-object baseline with register-like navigation. AROS/Zune uses a warmer AROS Default–inspired object field, blue active framing, amber selection, compact push-button navigation, striped title grips, and a subtle open-system desktop texture. The two themes share semantic roles because those roles describe host meaning, not because their CSS is aliased.

It is also not AmigaOS 4. The AmigaOS 4 recipe models a polished ReAction and composited Workbench vocabulary with pearl surfaces, smooth blue gradients, larger radii, and Final Edition depth. AROS/Zune remains more modular, angular, and preference-object oriented. It does not borrow AmigaOS 4 icons, ReAction artwork, product marks, or runtime assumptions.

The fixed light baseline exists only to make the packaged recipe and future Showcase evidence deterministic. Actual AROS/Zune installations are extensively configurable. This theme does not invent an automatic historical dark preset and does not claim to represent every AROS distribution, user skin, or Zune configuration.

## Ownership Boundary

The gem owns deterministic presentation source and the same shared 24 semantic roles used by the other Heritage themes, independently namespaced as `aros-zune-*`. The host owns semantic HTML, accessible names, data, routes, authorization, forms, sorting, mutation, keyboard behavior, Rails/React integration, and native ActiveAdmin behavior. Requiring the gem has no styling side effect.

The installer writes one application-owned `active_admin_aros_zune.css`. A host must explicitly import it, set `data-activeadmin-theme="aros_zune"`, and apply classes from `AROSZune::COMPOSITION.slots`. A Showcase consumer must prove the installed package on a representative operations surface at desktop and narrow widths before the theme is generalized or promoted.

—
Stan Carver II
Made in Texas 🤠
https://stancarver.com
