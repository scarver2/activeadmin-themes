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

## Showcase Migration Follow-up

Showcase should replace its page-scoped monolithic CSS with the installed gem recipe, put the theme data attribute on `body`, apply the documented slot classes to its existing markup, and delete the promoted CSS. Its Account Explorer endpoint, React island, fallback, table semantics, routes, and tests remain Showcase-owned. Fresh exact-head desktop/narrow light/dark screenshots are required after that migration; the historical PR #73 images establish design intent but do not prove the new installed path.

—
Stan Carver II
Made in Texas 🤠
https://stancarver.com
