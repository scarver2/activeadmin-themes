# spec/active_admin/themes/recipes/workbench13_spec.rb
# frozen_string_literal: true

require "spec_helper"
require "active_admin/themes/workbench_13"

RSpec.describe ActiveAdmin::Themes::Recipes::Workbench13 do
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

  it "composes the approved Workbench presentation contract deterministically" do
    source = described_class.source

    expect(Array.new(3) { described_class.source }).to all(eq(source))
    expect(source).to include('body[data-activeadmin-theme="workbench-13"]')
    expect(source).to include(".workbench-13-workspace", ".workbench-13-window", "forced-colors")
  end

  it "keeps the historical presentation fixed instead of inventing a dark variant" do
    source = described_class.source

    expect(source).to include("color-scheme: light")
    expect(source).not_to include("prefers-color-scheme")
  end

  it "does not package host behavior, implementation hooks, or ordinary icon dependencies" do
    expect(described_class.source).not_to include(
      "Account", "data-testid", "showcase-", "admin_", "Heroicons", "Lucide", "Rails", "React"
    )
  end

  it "publishes only the approved stable composition slots" do
    expect(ActiveAdmin::Themes::Workbench13::COMPOSITION.slots.keys).to match_array(expected_slots)
  end
end
