<!-- docs/theme-compositions.md -->

# Theme Composition Architecture

## Public Contract

A full theme is three deliberately separate concepts:

- `Skin` owns semantic color and visual-token CSS.
- `Composition` owns layout CSS plus a stable map of named classes a host applies to its markup.
- `Theme` binds one skin and one composition to ActiveAdmin compatibility and a recipe version.

`StylesheetManifest` composes an explicit ordered list of packaged CSS parts. Empty files are valid stable slots; repeated composition produces identical bytes. Manifests never use globs or directory order. A theme recipe always places skin source before composition source.

This contract allows a future theme to reuse a skin or composition without treating a color palette as a full theme. It also makes the installed artifact straightforward: the existing recipe installer still writes one deterministic `active_admin_<theme>.css` beside a host-selected Tailwind entrypoint. The host owns that file and its explicit import. Requiring the gem performs no installation, asset injection, ActiveAdmin configuration, DOM mutation, or styling side effect.

## Texas Bluebonnet

Texas Bluebonnet is the first full-theme migration. Its source hierarchy is:

```text
recipes/texas_bluebonnet/
  foundation/
    tokens.css
    base.css
  components/
    navigation.css
    actions.css
    data.css
    support.css
  surfaces/
    workspace.css
  hardening/
    responsive.css
    preferences.css
```

The palette, editorial heading, full-width workspace, on-demand AA4 drawer, continuous data surface, contextual support rail, compact actions, narrow layout, focus treatment, reduced motion, and forced-colors intent derive from the approved [ActiveAdmin React Showcase PR #73](https://github.com/scarver2/activeadmin-react-showcase/pull/73). The accepted rendered-source provenance recorded by that PR is `13a2557f7f92bc7d9513e96b74bb363e88e7b775`, refreshed onto Showcase master `cedad515622940ed5200a408dd98bff7e6f9a462`.

The migration intentionally does not copy `AccountExplorer`, Rails routes, authorization, data, `data-testid` selectors, Showcase class names, React components, or JavaScript behavior. The gem supplies presentation only.

## Host Markup Contract

The host opts in by setting `data-activeadmin-theme="texas-bluebonnet"` on its `body` and applying classes from `TexasBluebonnet::COMPOSITION.slots`. The stable slots are:

| Slot | CSS class |
| --- | --- |
| `workspace` | `bluebonnet-workspace` |
| `context` | `bluebonnet-context` |
| `heading` | `bluebonnet-heading` |
| `eyebrow` | `bluebonnet-eyebrow` |
| `action` | `bluebonnet-action` |
| `workspace_bar` | `bluebonnet-workspace-bar` |
| `current` | `bluebonnet-current` |
| `source` | `bluebonnet-source` |
| `workspace_content` | `bluebonnet-content` |
| `main` | `bluebonnet-data` |
| `support` | `bluebonnet-support` |
| `footnote` | `bluebonnet-footnote` |
| `data_surface` | `bluebonnet-data-surface` |
| `toolbar` | `bluebonnet-toolbar` |
| `data_table` | `bluebonnet-data-table` |
| `pagination` | `bluebonnet-pagination` |

Classes describe presentation roles rather than application components. The host remains responsible for semantic HTML, accessible names, routes, authorization, interactions, responsive data behavior, and whether a surface is Rails-rendered or enhanced by React.

AA4 remains authoritative for behavior. The recipe uses current AA4 presentation hooks for its top shell, drawer, page header, and content container. Those selectors are an explicit compatibility surface to verify when ActiveAdmin changes; they are not a replacement for native behavior.

## Workbench 1.3

Workbench 1.3 is the first Heritage Theme promoted from a bounded Showcase study. It uses the same public `Skin` + `Composition` + `Theme` contract while deliberately stressing a different design language:

```text
recipes/workbench_13/
  foundation/
    tokens.css
    base.css
  components/
    navigation.css
    launchers.css
    windows.css
    data.css
    forms.css
  surfaces/
    workspace.css
  hardening/
    responsive.css
    preferences.css
```

The host opts in with `data-activeadmin-theme="workbench-13"` and applies classes from `Workbench13::COMPOSITION.slots`. Its presentation is intentionally fixed: a host dark preference does not create a fictitious dark Workbench. Forced-colors remains user-controlled and is the only token substitution.

The 24 stable slots are:

| Slot | CSS class |
| --- | --- |
| `workspace` | `workbench-13-workspace` |
| `screen_header` | `workbench-13-screen-header` |
| `navigation` | `workbench-13-navigation` |
| `launcher_group` | `workbench-13-launcher-group` |
| `launcher` | `workbench-13-launcher` |
| `launcher_art` | `workbench-13-launcher-art` |
| `workspace_grid` | `workbench-13-workspace-grid` |
| `window` | `workbench-13-window` |
| `primary_window` | `workbench-13-primary-window` |
| `side_window` | `workbench-13-side-window` |
| `wide_window` | `workbench-13-wide-window` |
| `window_header` | `workbench-13-window-header` |
| `window_content` | `workbench-13-window-content` |
| `status` | `workbench-13-status` |
| `data_region` | `workbench-13-data-region` |
| `data_table` | `workbench-13-data-table` |
| `status_tag` | `workbench-13-status-tag` |
| `window_actions` | `workbench-13-window-actions` |
| `form` | `workbench-13-form` |
| `actions` | `workbench-13-actions` |
| `primary_action` | `workbench-13-primary-action` |
| `secondary_action` | `workbench-13-secondary-action` |
| `help` | `workbench-13-help` |
| `footer` | `workbench-13-footer` |

The launcher illustration is original CSS geometry owned by this composition. It is not an ordinary functional icon and does not expand or depend on the semantic icon registry. The host continues to own semantic HTML, labels, routes, authorization, data, interactions, and the decision to use Rails or React.

## Workbench 2.x

Workbench 2.x deliberately preserves the same stable presentation-role vocabulary as Workbench 1.3 while changing the entire historical grammar beneath those roles. The explicit hierarchy is identical in shape and independently composed from `recipes/workbench_2/`; it does not import, alias, or mutate Workbench 1.3 CSS.

The host opts in with `data-activeadmin-theme="workbench-2"` and classes from `Workbench2::COMPOSITION.slots`. Each of the 24 Workbench 1.3 role names is available under an independent `workbench-2-*` class. This lets a Showcase consumer prove the same semantic page across both lineages without putting release-specific layout decisions in Rails or React.

Its surface is fixed rather than color-scheme adaptive. The four-pen pseudo-3D model uses semantic surface, text, shine, shadow, fill, and fill-text tokens; `forced-colors` is the sole token substitution. Full historical provenance and the source-to-adaptation ledger are recorded in [Workbench 2.x theme provenance](workbench-2.md).

## MUI

MUI preserves the shared 24-role Heritage contract while replacing the desktop-window grammar with a configurable application-toolkit grammar. Its independent `mui-*` namespace uses semantic tokens for frame depth, active color, field surfaces, radii, and object gaps. The bundled silver/teal values are an original baseline, not a claim that MUI had one canonical palette; hosts can override the tokens without changing the slot map or composition selectors.

The host opts in with `data-activeadmin-theme="mui"` and classes from `Mui::COMPOSITION.slots`. The recipe remains asset-free and does not recreate MUI runtime classes, preferences, requesters, or behavior. Its provenance, lineage boundary, accessibility adaptations, and dedication are recorded in [MUI theme provenance](mui.md).

## AROS/Zune

AROS/Zune preserves the same 24 semantic Heritage roles while deliberately proving that a compatible toolkit lineage need not share presentation bytes. Its independent `aros-zune-*` namespace uses an AROS Default–inspired warm object field, blue active frames, amber selection, compact push-button navigation, and preference-driven object grouping. It does not import or alias MUI or AmigaOS 4 concerns.

The host opts in with `data-activeadmin-theme="aros_zune"` and classes from `AROSZune::COMPOSITION.slots`. The fixed light baseline exists for deterministic review; hosts may override semantic tokens to exercise Zune's user-owned presentation principle. The recipe remains asset-free and does not recreate Zune classes, AROS preferences, Wanderer behavior, or MUI compatibility APIs. Its primary-source provenance, APL boundary, lineage distinctions, and accessibility adaptations are recorded in [AROS/Zune theme provenance](aros-zune.md).

## Haiku R1/beta6

Haiku beta6 preserves the shared 24-role Heritage contract while proving a lineage outside the Amiga toolkit sequence. Its independent `haiku-beta6-*` namespace uses the beta6 default blue desktop, light-gray control field, white document well, blue focus/highlight, and iconic yellow partial-width active tab. The recipe does not import or alias any Workbench, MUI, AmigaOS 4, or AROS/Zune concern.

The host opts in with `data-activeadmin-theme="haiku_beta6"` and classes from `HaikuBeta6::COMPOSITION.slots`. The fixed light baseline provides deterministic review of the canonical yellow-tab grammar; the host may explicitly override semantic tokens. The recipe remains asset-free and does not recreate Tracker, Deskbar, Stack & Tile, decorator, or window-manager behavior. Exact beta6 source provenance, license boundaries, lineage distinctions, and accessibility adaptations are recorded in [Haiku R1/beta6 theme provenance](haiku-beta6.md).

## Video Toaster 4000 / Period LightWave

Video Toaster 4000 preserves the shared 24-role Heritage contract while proving a professional media-production lineage rather than another desktop or widget toolkit. Its independent `video-toaster-4000-*` namespace uses a dark neutral equipment field, compact labeled control bays, recessed data wells, and restrained cyan, green, amber, and red channel/status cues. It does not import or alias Haiku, AROS/Zune, AmigaOS 4, MUI, or Workbench concerns.

The host opts in with `data-activeadmin-theme="video_toaster_4000"` and classes from `VideoToaster4000::COMPOSITION.slots`. The fixed dark baseline provides deterministic review of the period broadcast-workstation grammar; the host may explicitly override semantic tokens. The recipe remains CSS-only and asset-free. It does not reproduce a switcher, editor, Modeler, Layout, character generator, proprietary control, or media-production behavior. Historical scope, proprietary-reference boundaries, and accessibility adaptations are recorded in [Video Toaster 4000 theme provenance](video-toaster-4000.md).

## Mercury Flight

Mercury Flight preserves the shared 24-role Heritage contract while proving a campaign-operations product lineage rather than an operating system, toolkit, or media-production console. Its independent `mercury-flight-*` namespace uses a warm oxblood surround, paper-white work surface, charcoal capability navigation, signal-coral actions, salmon data headers, and compact campaign rows. It does not import or alias Video Toaster, Haiku, AROS/Zune, AmigaOS 4, MUI, or Workbench concerns.

The host opts in with `data-activeadmin-theme="mercury_flight"` and classes from `MercuryFlight::COMPOSITION.slots`. The fixed light baseline preserves the reference product's deliberate hierarchy while forced-colors remains user-controlled. The recipe is CSS-only and asset-free; it does not redistribute the preserved corpus's source, markup, images, fonts, icon font, names, data, or behavior. Corpus hashes, reuse boundaries, characteristic rules, and accessibility adaptations are recorded in [Mercury Flight theme provenance](mercury-flight.md).

## Showcase Migration Follow-up

Showcase should replace its page-scoped monolithic CSS with the installed gem recipe, put the theme data attribute on `body`, apply the documented slot classes to its existing markup, and delete the promoted CSS. Its Account Explorer endpoint, React island, fallback, table semantics, routes, and tests remain Showcase-owned. Fresh exact-head desktop/narrow light/dark screenshots are required after that migration; the historical PR #73 images establish design intent but do not prove the new installed path.

—
Stan Carver II
Made in Texas 🤠
https://stancarver.com
