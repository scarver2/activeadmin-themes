# spec/active_admin/themes/recipes/haiku_beta6_spec.rb
# frozen_string_literal: true

require "spec_helper"
require "activeadmin-themes"

RSpec.describe ActiveAdmin::Themes::Recipes::HaikuBeta6 do
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
    expect(ActiveAdmin::Themes::HaikuBeta6.theme.source).to eq(source)
    expect(source).to include('body[data-activeadmin-theme="haiku_beta6"]', "forced-colors")
  end

  it "keeps the canonical yellow-tab light baseline without inventing an automatic dark preset" do
    source = described_class.source

    expect(source).to include("color-scheme: light")
    expect(source).not_to include("prefers-color-scheme")
  end

  it "expresses the beta6 default palette and partial-tab window grammar" do # rubocop:disable RSpec/ExampleLength
    source = described_class.source

    expect(source).to include(
      "--haiku-beta6-desktop: #336698",
      "--haiku-beta6-panel: #d8d8d8",
      "--haiku-beta6-tab: #ffcb00",
      "--haiku-beta6-focus: #0000e5",
      ":is(.haiku-beta6-primary-window, .haiku-beta6-wide-window)",
      "width: fit-content"
    )
  end

  it "does not package upstream assets, marks, fonts, host behavior, or framework hooks" do
    expect(described_class.source).not_to include(
      "Haiku.png", "leaf", "HVIF", "data-testid", "showcase-", "admin_", "Rails", "React", "url("
    )
  end

  it "publishes the stable heritage roles under an independent prefix" do
    composition = ActiveAdmin::Themes::HaikuBeta6::COMPOSITION

    expect(composition.slots.keys).to match_array(expected_slots)
    expect(composition.slots.values).to all(start_with("haiku-beta6-"))
    expect(composition.slots.values).not_to include(*ActiveAdmin::Themes::AROSZune::COMPOSITION.slots.values)
    expect(composition.slots.values).not_to include(*ActiveAdmin::Themes::Mui::COMPOSITION.slots.values)
  end

  it "keeps action roles above generic controls in cascade order" do
    source = described_class.source
    shared = ":where(.haiku-beta6-form select, .haiku-beta6-primary-action, .haiku-beta6-secondary-action)"
    primary = ".haiku-beta6-workspace .haiku-beta6-primary-action {"

    expect(source.index(shared)).to be < source.index(primary)
    expect(source).to include("#{primary}\n  background: linear-gradient(to bottom, #8ab6df")
  end
end
