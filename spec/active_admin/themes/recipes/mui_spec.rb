# spec/active_admin/themes/recipes/mui_spec.rb
# frozen_string_literal: true

require "spec_helper"
require "active_admin/themes/mui"

RSpec.describe ActiveAdmin::Themes::Recipes::Mui do
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
    expect(ActiveAdmin::Themes::Mui.theme.source).to eq(source)
    expect(source).to include('body[data-activeadmin-theme="mui"]', "forced-colors")
  end

  it "keeps an explicit baseline instead of inventing an automatic dark preset" do
    source = described_class.source

    expect(source).to include("color-scheme: light")
    expect(source).not_to include("prefers-color-scheme")
  end

  it "expresses configurable MUI object, frame, and register grammar" do # rubocop:disable RSpec/ExampleLength
    source = described_class.source

    expect(source).to include(
      "--mui-desktop: #566166",
      "--mui-surface: #c9cecc",
      "--mui-frame-radius: 0.45rem",
      "--mui-object-gap: 0.75rem",
      ":is(.mui-primary-window, .mui-wide-window)",
      "background: var(--mui-active);"
    )
  end

  it "does not package historical assets, host behavior, or framework hooks" do
    expect(described_class.source).not_to include(
      "Account", "data-testid", "showcase-", "admin_", "Heroicons", "Lucide", "Rails", "React", "url("
    )
  end

  it "publishes the stable heritage roles under an independent prefix" do
    composition = ActiveAdmin::Themes::Mui::COMPOSITION

    expect(composition.slots.keys).to match_array(expected_slots)
    expect(composition.slots.values).to all(start_with("mui-"))
    expect(composition.slots.values).not_to include(*ActiveAdmin::Themes::Workbench3::COMPOSITION.slots.values)
  end

  it "keeps action roles above generic controls in cascade order" do
    source = described_class.source
    shared = ":where(.mui-form select, .mui-primary-action, .mui-secondary-action)"
    primary = ".mui-workspace .mui-primary-action {"

    expect(source.index(shared)).to be < source.index(primary)
    expect(source).to include("#{primary}\n  background: var(--mui-active);")
  end
end
