# spec/active_admin/themes/recipes/mercury_flight_spec.rb
# frozen_string_literal: true

require "spec_helper"
require "activeadmin-themes"

RSpec.describe ActiveAdmin::Themes::Recipes::MercuryFlight do
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
    expect(ActiveAdmin::Themes::MercuryFlight.theme.source).to eq(source)
    expect(source).to include('body[data-activeadmin-theme="mercury_flight"]', "forced-colors")
  end

  it "keeps the original fixed light campaign-console baseline" do
    source = described_class.source

    expect(source).to include("color-scheme: light")
    expect(source).not_to include("prefers-color-scheme")
  end

  it "expresses the oxblood, paper, charcoal, and signal-coral grammar" do # rubocop:disable RSpec/ExampleLength
    source = described_class.source

    expect(source).to include(
      "--mercury-flight-backdrop: #3c110b",
      "--mercury-flight-paper: #fffdf9",
      "--mercury-flight-coral: #e44d34",
      "--mercury-flight-nav: #29292b",
      ".mercury-flight-workspace-grid",
      ".mercury-flight-launcher-art"
    )
  end

  it "does not package reference assets, fonts, host behavior, or framework hooks" do
    expect(described_class.source).not_to include(
      "main-bg-grad", "nav-logo", "helmet", "Voltaire", "foundation-icons", "data-testid", "showcase-", "Rails",
      "React", "url("
    )
  end

  it "publishes stable roles under an independent namespace" do
    composition = ActiveAdmin::Themes::MercuryFlight::COMPOSITION

    expect(composition.slots.keys).to match_array(expected_slots)
    expect(composition.slots.values).to all(start_with("mercury-flight-"))
    expect(composition.slots.values).not_to include(*ActiveAdmin::Themes::VideoToaster4000::COMPOSITION.slots.values)
    expect(composition.slots.values).not_to include(*ActiveAdmin::Themes::TexasBluebonnet::COMPOSITION.slots.values)
  end

  it "keeps specific action roles after shared controls in cascade order" do # rubocop:disable RSpec/ExampleLength
    source = described_class.source
    shared = ":where(.mercury-flight-form select, .mercury-flight-primary-action, " \
             ".mercury-flight-secondary-action)"
    primary = ".mercury-flight-workspace .mercury-flight-primary-action {"

    expect(source.index(shared)).to be < source.index(primary)
    expect(source).to include("#{primary}\n  background: var(--mercury-flight-coral)")
  end
end
