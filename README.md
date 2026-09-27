<!-- README.md -->

# ActiveAdmin Themes

Explicit, inspectable visual theme recipes for ActiveAdmin 4.

## Status

Requiring `activeadmin-themes` does **not** restyle a Rails application. Hosts explicitly install a recipe, own the resulting CSS file, and add its import to their existing Tailwind entrypoint.

The first registered theme is `:v3`: ActiveAdmin 3.5-inspired hierarchy, density, and polish implemented on ActiveAdmin 4's Tailwind-era foundation—not copied legacy CSS.

```ruby
require "active_admin/themes"

theme = ActiveAdmin::Themes.registry.fetch(:v3)
theme.supports?(ActiveAdmin::VERSION)
theme.skin
theme.composition
```

The catalog also includes `:texas_bluebonnet`, the first full theme built on the reusable skin/composition contract. Its presentation direction comes from the approved [Showcase PR #73](https://github.com/scarver2/activeadmin-react-showcase/pull/73); the gem does not copy Showcase routes, data, behavior, or React components.

```bash
bundle exec rake 'activeadmin_themes:install[texas_bluebonnet,app/assets/stylesheets/active_admin.css]'
```

See [Theme composition architecture](docs/theme-compositions.md) for the host markup contract and migration boundary.

## Development

```bash
bin/setup
bin/test
bin/ci
```

See the [documentation index](docs/README.md). [Rodeo issue #235](https://github.com/a1web/rodeo/issues/235) tracks eventual application adoption.

## Showcase

The [ActiveAdmin React Showcase](https://github.com/scarver2/activeadmin-react-showcase) is the designated executable reference application for themes across ordinary ActiveAdmin pages and optional React islands. The Showcase proves visual integrations and browser behavior while consuming gem-owned presentation contracts.

`activeadmin-themes` owns presentation recipes; `activeadmin-react` owns optional React integration. Neither gem requires the other. The Showcase will prove them together before Rodeo adoption.

Implementation follows the [Rodeo lessons and acceptance directives](https://github.com/scarver2/activeadmin-themes/issues/13).

## License

[MIT](LICENSE) © 2026 Stan Carver II.

—
Stan Carver II
Made in Texas 🤠
https://stancarver.com
