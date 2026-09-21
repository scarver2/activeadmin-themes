# spec/active_admin/themes/recipes/amigaos4_spec.rb
# frozen_string_literal: true

require "spec_helper"
require "activeadmin-themes"

RSpec.describe ActiveAdmin::Themes::Recipes::AmigaOS4 do
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
    expect(ActiveAdmin::Themes::AmigaOS4.theme.source).to eq(source)
    expect(source).to include('body[data-activeadmin-theme="amigaos_4"]', "forced-colors")
  end

  it "keeps a documented light baseline instead of inventing an automatic dark preset" do
    source = described_class.source

    expect(source).to include("color-scheme: light")
    expect(source).not_to include("prefers-color-scheme")
  end

  it "expresses the Final Edition ReAction and composited Workbench grammar" do # rubocop:disable RSpec/ExampleLength
    source = described_class.source

    expect(source).to include(
      "--amigaos-4-desktop: #58788d",
      "--amigaos-4-surface: #e7edf1",
      "--amigaos-4-frame-radius: 0.65rem",
      "radial-gradient(circle at 18% 5%",
      ":is(.amigaos-4-primary-window, .amigaos-4-wide-window)",
      "background: linear-gradient(to bottom, #4bace9"
    )
  end

  it "does not package historical assets, product marks, host behavior, or framework hooks" do
    expect(described_class.source).not_to include(
      "Account", "Boing", "data-testid", "showcase-", "admin_", "Heroicons", "Lucide", "Rails", "React", "url("
    )
  end

  it "publishes the stable heritage roles under an independent prefix" do
    composition = ActiveAdmin::Themes::AmigaOS4::COMPOSITION

    expect(composition.slots.keys).to match_array(expected_slots)
    expect(composition.slots.values).to all(start_with("amigaos-4-"))
    expect(composition.slots.values).not_to include(*ActiveAdmin::Themes::Mui::COMPOSITION.slots.values)
  end

  it "keeps action roles above generic controls in cascade order" do
    source = described_class.source
    shared = ":where(.amigaos-4-form select, .amigaos-4-primary-action, .amigaos-4-secondary-action)"
    primary = ".amigaos-4-workspace .amigaos-4-primary-action {"

    expect(source.index(shared)).to be < source.index(primary)
    expect(source).to include("#{primary}\n  background: linear-gradient(to bottom, #4bace9")
  end
end
