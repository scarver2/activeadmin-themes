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

## Showcase Migration Follow-up

Showcase should replace its page-scoped monolithic CSS with the installed gem recipe, put the theme data attribute on `body`, apply the documented slot classes to its existing markup, and delete the promoted CSS. Its Account Explorer endpoint, React island, fallback, table semantics, routes, and tests remain Showcase-owned. Fresh exact-head desktop/narrow light/dark screenshots are required after that migration; the historical PR #73 images establish design intent but do not prove the new installed path.

—
Stan Carver II
Made in Texas 🤠
https://stancarver.com
