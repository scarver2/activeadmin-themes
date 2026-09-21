# spec/active_admin/themes/recipes/workbench2_spec.rb
# frozen_string_literal: true

require "spec_helper"
require "active_admin/themes/workbench_2"

RSpec.describe ActiveAdmin::Themes::Recipes::Workbench2 do
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
    expect(ActiveAdmin::Themes::Workbench2.theme.source).to eq(source)
    expect(source).to include('body[data-activeadmin-theme="workbench-2"]', "forced-colors")
  end

  it "keeps the historical presentation fixed instead of inventing a dark variant" do
    source = described_class.source

    expect(source).to include("color-scheme: light")
    expect(source).not_to include("prefers-color-scheme")
  end

  it "expresses the Release 2 four-pen and pseudo-3D grammar" do # rubocop:disable RSpec/ExampleLength
    source = described_class.source

    expect(source).to include(
      "--workbench-2-surface: #9b9b9b",
      "--workbench-2-text: #111111",
      "--workbench-2-shine: #f5f5f5",
      "--workbench-2-shadow: #3f3f3f",
      "--workbench-2-fill: #315f9b",
      "border-color: var(--workbench-2-shine) var(--workbench-2-shadow)"
    )
  end

  it "does not package historical assets, host behavior, or framework hooks" do
    expect(described_class.source).not_to include(
      "Account", "data-testid", "showcase-", "admin_", "Heroicons", "Lucide", "Rails", "React", "url("
    )
  end

  it "publishes the stable heritage composition roles under an independent prefix" do
    composition = ActiveAdmin::Themes::Workbench2::COMPOSITION

    expect(composition.slots.keys).to match_array(expected_slots)
    expect(composition.slots.values).to all(start_with("workbench-2-"))
    expect(composition.slots.values).not_to include(*ActiveAdmin::Themes::Workbench13::COMPOSITION.slots.values)
  end

  it "keeps action roles above generic controls in cascade order" do
    source = described_class.source
    shared = ":where(.workbench-2-form select, .workbench-2-primary-action, .workbench-2-secondary-action)"
    primary = ".workbench-2-workspace .workbench-2-primary-action {"

    expect(source.index(shared)).to be < source.index(primary)
    expect(source).to include("#{primary}\n  background: var(--workbench-2-fill);")
  end
end
