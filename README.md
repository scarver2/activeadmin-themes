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

`:workbench_13` translates the approved Workbench 1.3 Heritage Laboratory study into a fixed historical light presentation. Its CSS drawer art belongs to the composition rather than the ordinary functional icon registry. The recipe does not ship an emulator, historical assets, application behavior, or an invented dark variant.

`:workbench_2` independently translates the Workbench 2.x pseudo-3D four-pen visual grammar. It uses original CSS geometry for beveled surfaces and launchers, preserves a fixed historical presentation, and does not redistribute Amiga artwork, fonts, or software.

`:workbench_3` translates the late-Commodore Workbench 3.x visual grammar without mixing in MUI, MagicWB, NewIcons, or Amiga Forever 3.X additions. Its original CSS dither, white screen-information bar, and active-blue window hierarchy preserve a fixed historical presentation without redistributing historical assets.

`:mui` translates MUI's configurable, font-sensitive application-object grammar into the shared Heritage contract. Its original silver/teal baseline, framed groups, register-like navigation, and recessed fields are asset-free and intentionally distinct from Workbench 3.x.

`:amigaos_4` translates the AmigaOS 4.1 Final Edition Workbench and ReAction visual language into an original cool-blue, pearl, and graphite workspace. It preserves configurable, adaptive interface principles without copying system icons, fonts, backdrops, wordmarks, or title-bar artwork.

`:aros_zune` translates AROS's open-source Zune object grammar into an original warm cream, blue, and amber workspace. It preserves semantic, font-sensitive, user-configurable layout principles without copying AROS source, preferences, icons, fonts, screenshots, marks, or runtime behavior.

`:haiku_beta6` translates Haiku R1/beta6's clear desktop and Tracker-era utility grammar into an original blue, gray, white, and iconic-yellow workspace. It preserves the partial-width active tab and clean control hierarchy without copying Haiku source, icons, fonts, screenshots, marks, or window-manager behavior.

`:video_toaster_4000` translates the dense broadcast-workstation character of the 1993 Video Toaster 4000 and period LightWave into an original dark control-field composition. It uses labeled bays, recessed data wells, and restrained channel/status colors without copying NewTek or LightWave source, artwork, marks, screenshots, icons, fonts, or behavior.

`:mercury_flight` translates Sheriff's preserved Mercury Flight campaign-operations theme into an original oxblood, paper, charcoal, and signal-coral composition. It preserves compact navigation, dense campaign data, contextual tools, and direct actions without redistributing the reference corpus's images, fonts, icon font, source, markup, names, data, or behavior.

```bash
bundle exec rake 'activeadmin_themes:install[texas_bluebonnet,app/assets/stylesheets/active_admin.css]'
bundle exec rake 'activeadmin_themes:install[workbench_13,app/assets/stylesheets/active_admin.css]'
bundle exec rake 'activeadmin_themes:install[workbench_2,app/assets/stylesheets/active_admin.css]'
bundle exec rake 'activeadmin_themes:install[workbench_3,app/assets/stylesheets/active_admin.css]'
bundle exec rake 'activeadmin_themes:install[mui,app/assets/stylesheets/active_admin.css]'
bundle exec rake 'activeadmin_themes:install[amigaos_4,app/assets/stylesheets/active_admin.css]'
bundle exec rake 'activeadmin_themes:install[aros_zune,app/assets/stylesheets/active_admin.css]'
bundle exec rake 'activeadmin_themes:install[haiku_beta6,app/assets/stylesheets/active_admin.css]'
bundle exec rake 'activeadmin_themes:install[video_toaster_4000,app/assets/stylesheets/active_admin.css]'
bundle exec rake 'activeadmin_themes:install[mercury_flight,app/assets/stylesheets/active_admin.css]'
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
