<!-- docs/video-toaster-4000.md -->

# Video Toaster 4000 / Period LightWave Theme Provenance

## Canonical Reference

This independent Heritage Themes study follows the approved sequence in [ActiveAdmin React Showcase issue #103](https://github.com/scarver2/activeadmin-react-showcase/issues/103). Its canonical boundary is Video Toaster 3.1 on the 1993 Video Toaster 4000 and LightWave 3D 3.5 for Amiga in 1994. LightWave 3.0/Video Toaster 4000 material confirms lineage only. This is not a generic dark video editor and does not incorporate Flyer 4.1/4.2, Video Toaster for Windows, TriCaster, LightWave 4/5, or modern LightWave styling. The following sources were inspected on September 22, 2026:

- [Official LightWave history](https://lightwave3d.com/documentation/lightwave-history/), used for the corporate chronology and first-party 1993–1994 interface captures. The specific first-party references are [1993 Modeler](https://lightwave3d.com/media/images/1993-LW30-Modeler.width-800.png), [1993 Layout](https://lightwave3d.com/media/images/1993-LW30-Layout.width-800.png), [1993 LightWave 3D 4000](https://lightwave3d.com/media/images/1993-LightWave_3D_4000.width-800.jpg), [1994 LightWave 3.5 Layout](https://lightwave3d.com/media/images/1994-Layout3.5.width-800.png), and [1994 LightWave 3.5 Modeler](https://lightwave3d.com/media/images/1994-Modeler3.5.width-800.gif). The 1994 captures define the canonical LightWave surface; the 1993 captures confirm its immediate lineage.
- [Video Toaster 4000 Manual](https://retro-commodore.eu/files/downloads/amigamanuals-xiik.net/Hardware/Video%20Toaster%204000%20-%20Manual-ENG.pdf), copyright 1990–1995 NewTek, used as a period primary reference for the product boundary, named production tools, and dense control-workstation context.
- [NewTek Video Toaster Developer's Handbook](https://discreetfx.com/documents/NewTekVideoToasterDevelopersHandbook.pdf), copyright 1995 NewTek, used as a period primary technical reference for the system's source/channel and effects vocabulary.
- [Kansas Historical Society Video Toaster Manual artifact record](https://www.kansashistory.gov/museum/musobjs/view/320071), used as an institutional record of the manual and the affordable production-suite context.
- [Amiga Hardware Database Video Toaster 4000 record](https://amiga.resource.cx/exp/videotoaster4000), used as a secondary source to cross-check the 1993 A4000 release, AGA support, nine effects banks, triple frame buffers, Character Generator, and LightWave recording boundary.
- [Restored 1993 NewTek Video Toaster 4000 promotional footage](https://www.youtube.com/watch?v=fH3keLuj9OI), used as period first-party promotional evidence of the workstation boundary, not as reusable media.
- [Issue #103 Video Toaster 3.1 reference](https://i.ytimg.com/vi/6yFdaCmRkBk/maxresdefault.jpg), supplied by Sheriff from a 2020 AmigaBill/The Guru Meditation demonstration of actual hardware and software. It is secondary observational evidence, not official NewTek material. The inspected file's SHA-256 is `13ef92cb41ddf370d18e8edb3312fb9d17ebce5809503b6e424051d6e2e80aaa`; the file is not redistributed.
- [Vizrt brand guidelines](https://www.vizrt.com/wp-content/uploads/2023/09/Vizrt-Brand-Guidelines-2023-External.pdf), used only to confirm that Video Toaster and LightWave 3D remain registered marks.

The surviving Open Video Toaster release is not treated as reusable design source: contemporary reporting noted that a specific open-source license was not evident. The manuals, captures, screenshot, product names, marks, and original interface artwork remain proprietary reference material. This repository copies none of them.

The recipe's CSS, geometry, launcher meter, responsive rules, and accessibility adaptations are original work under this repository's MIT license. It contains no NewTek or LightWave source, screenshot, bitmap, texture, icon, font, logo, wordmark, trademark artwork, or proprietary media. Video Toaster, LightWave, NewTek, Amiga, and related marks belong to their respective owners; this is not an official product or endorsement.

## Historical Reference → AA4 Constraint → Theme Adaptation

| Historical reference | Characteristic design rules | ActiveAdmin 4 adaptation |
| --- | --- | --- |
| Video Toaster 3.1 | Dense banked operator console with uppercase rule-separated zones, effects banks, source buses, and an action strip | Stable launcher and window roles form original semantic bank/control regions; no fake source bus, effect, transport, or broadcast state is introduced |
| LightWave 3.5 Amiga | Semantic tabs, a left tool rack, dominant dark viewport, and bottom timeline/status readouts | Top navigation, supporting controls, a continuous data workspace, and status/pagination preserve the hierarchy without recreating a 3D viewport or editor |
| Switcher/channel vocabulary | Current, available, tally, and exceptional states must be legible at a glance | Yellow selection is reinforced by borders, labels, and geometry; red is reserved as a semantic tally/danger token and is never presented as fake live state |
| Period control surfaces | Small squared buttons and compressed control banks favor expert throughput | Typography and spacing remain compact, but interactive controls retain 44px targets, explicit focus, and readable contrast |
| Dedicated editing workstation | Dense primary tool surface with supporting status and control regions | A wide data surface and bounded side bay reflow into one column at narrower widths; no fixed coordinates or desktop-only assumption survives |
| Current accessibility requirements | Period interfaces did not account for forced colors, zoom, touch, or reduced motion | Responsive grids, local table overflow, forced-colors tokens, reduced-motion handling, visible focus, and semantic host markup are required |

## Visual Vocabulary and Scope

The fixed baseline is intentionally dark because the period LightWave/Toaster production workspace was a professional tool environment, not an Amiga Workbench skin. The two reference grammars remain distinct: Video Toaster contributes banked console grouping and action emphasis, while LightWave contributes top modes, an edge-tool relationship, a dominant work region, and a compact status/readout strip. They are not averaged into generic gray controls everywhere. Its visual grammar is:

- a dark neutral tool field and graphite equipment panels;
- a readable platform monospace stack that evokes the compact tool grammar without bundling a proprietary bitmap font;
- compact uppercase bay labels and clear hierarchy;
- recessed near-black data and inspection wells;
- squared, lightly raised controls with visible active states;
- yellow for active selection, muted yellow for secondary current state, and red reserved for host-owned tally/danger semantics;
- dense tables, forms, and launchers that remain calm under operational load.

The colored launcher graphic is original CSS geometry suggesting a generic bank/status meter. It is not an effect thumbnail, Video Toaster mark, or LightWave icon. The theme does not reproduce a switcher, source bus, edit timeline, waveform, vectorscope, preview monitor, 3D viewport, Modeler/Layout control map, title generator, or any product-specific workflow. It styles existing ActiveAdmin semantics only. It also avoids CRT scanlines, noise, chromatic aberration, VHS damage, and novelty motion.

## Lineage Boundary

Video Toaster 4000 is a professional broadcast/editing application lineage, not another operating-system desktop generation. It shares the stable 24-role Heritage contract because those roles describe host meaning, but it does not import or alias Haiku, AROS/Zune, AmigaOS 4, MUI, or Workbench CSS. It also avoids later nonlinear-editor conventions that are not established by the 1993–1995 reference boundary.

The packaged baseline is a deterministic fixed dark presentation. A host may override semantic tokens explicitly. The theme does not offer an automatic light mode because that would invent a second historical baseline; forced colors remains user-controlled.

## Ownership Boundary

The gem owns deterministic presentation source and the shared 24 semantic roles under the independent `video-toaster-4000-*` namespace. The host owns semantic HTML, accessible names, data, routes, authorization, form submission, sorting, mutation, keyboard behavior, Rails/React integration, and native ActiveAdmin behavior. Requiring the gem has no styling side effect.

The installer writes one application-owned `active_admin_video_toaster_4000.css`. A host must explicitly import it, set `data-activeadmin-theme="video_toaster_4000"`, and apply classes from `VideoToaster4000::COMPOSITION.slots`. Showcase must prove the installed package on a representative production/operations surface at desktop and narrow widths before the theme is promoted.

—
Stan Carver II
Made in Texas 🤠
https://stancarver.com
