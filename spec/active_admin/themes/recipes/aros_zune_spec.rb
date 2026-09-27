# spec/active_admin/themes/recipes/aros_zune_spec.rb
# frozen_string_literal: true

require "spec_helper"
require "activeadmin-themes"

RSpec.describe ActiveAdmin::Themes::Recipes::AROSZune do
  let(:expected_parts) do
    %w[
      foundation/tokens foundation/base components/navigation components/launchers
      components/windows components/data components/forms surfaces/workspace
      hardening/responsive hardening/preferences
    ]
  end
  let(:expected_slots) do
    %i[
      actions data_region data_table footer form help launcher launcher_art launcher_group navigation
      primary_action primary_window screen_header secondary_action side_window status status_tag wide_window window
      window_actions window_content window_header workspace workspace_grid
    ]
  end

  it "defines explicit skin and composition manifests in cascade order" do
    expect(described_class::PARTS).to eq(expected_parts)
    expect(described_class::SKIN_PARTS + described_class::COMPOSITION_PARTS).to eq(expected_parts)
  end

  it "composes deterministic bytes through the public theme" do
    source = described_class.source

    expect(Array.new(3) { described_class.source }).to all(eq(source))
    expect(ActiveAdmin::Themes::AROSZune.theme.source).to eq(source)
    expect(source).to include('body[data-activeadmin-theme="aros_zune"]', "forced-colors")
  end

  it "keeps a documented light baseline instead of inventing an automatic dark preset" do
    source = described_class.source

    expect(source).to include("color-scheme: light")
    expect(source).not_to include("prefers-color-scheme")
  end

  it "expresses the AROS Default and adaptive Zune object grammar" do # rubocop:disable RSpec/ExampleLength
    source = described_class.source

    expect(source).to include(
      "--aros-zune-surface: #ece9bc",
      "--aros-zune-active: #4b72a5",
      "--aros-zune-selection: #f0cf63",
      "repeating-linear-gradient(135deg",
      ":is(.aros-zune-primary-window, .aros-zune-wide-window)",
      "background: var(--aros-zune-selection)"
    )
  end

  it "does not package upstream assets, product marks, host behavior, or framework hooks" do
    expect(described_class.source).not_to include(
      "AROS.png", "AROS.info", "Gorilla", "Mason", "data-testid", "showcase-", "admin_", "Rails", "React", "url("
    )
  end

  it "publishes the stable heritage roles under an independent prefix" do
    composition = ActiveAdmin::Themes::AROSZune::COMPOSITION

    expect(composition.slots.keys).to match_array(expected_slots)
    expect(composition.slots.values).to all(start_with("aros-zune-"))
    expect(composition.slots.values).not_to include(*ActiveAdmin::Themes::Mui::COMPOSITION.slots.values)
    expect(composition.slots.values).not_to include(*ActiveAdmin::Themes::AmigaOS4::COMPOSITION.slots.values)
  end

  it "keeps action roles above generic controls in cascade order" do
    source = described_class.source
    shared = ":where(.aros-zune-form select, .aros-zune-primary-action, .aros-zune-secondary-action)"
    primary = ".aros-zune-workspace .aros-zune-primary-action {"

    expect(source.index(shared)).to be < source.index(primary)
    expect(source).to include("#{primary}\n  background: linear-gradient(to bottom")
  end
end
