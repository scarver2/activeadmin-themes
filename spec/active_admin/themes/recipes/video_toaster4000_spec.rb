# spec/active_admin/themes/recipes/video_toaster_4000_spec.rb
# frozen_string_literal: true

require "spec_helper"
require "activeadmin-themes"

RSpec.describe ActiveAdmin::Themes::Recipes::VideoToaster4000 do
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
    expect(ActiveAdmin::Themes::VideoToaster4000.theme.source).to eq(source)
    expect(source).to include('body[data-activeadmin-theme="video_toaster_4000"]', "forced-colors")
  end

  it "keeps the fixed period workstation baseline without inventing an automatic alternate preset" do
    source = described_class.source

    expect(source).to include("color-scheme: dark")
    expect(source).not_to include("prefers-color-scheme")
  end

  it "expresses the period gray, selected-yellow, and tally-red production grammar" do # rubocop:disable RSpec/ExampleLength
    source = described_class.source

    expect(source).to include(
      "--video-toaster-4000-field: #514b56",
      "--video-toaster-4000-panel: #656565",
      "--video-toaster-4000-panel-raised: #9a9a9a",
      "--video-toaster-4000-well: #313131",
      "--video-toaster-4000-amber: #ffef75",
      "--video-toaster-4000-red: #c52828",
      "ui-monospace, SFMono-Regular, Menlo, Consolas",
      ".video-toaster-4000-workspace-grid",
      ".video-toaster-4000-launcher-art"
    )
  end

  it "does not package proprietary assets, marks, fonts, host behavior, or framework hooks" do
    expect(described_class.source).not_to include(
      "NewTek", "LightWave", "Toaster.png", "logo", "data-testid", "showcase-", "admin_", "Rails", "React", "url("
    )
  end

  it "publishes the stable heritage roles under an independent versioned prefix" do
    composition = ActiveAdmin::Themes::VideoToaster4000::COMPOSITION

    expect(composition.slots.keys).to match_array(expected_slots)
    expect(composition.slots.values).to all(start_with("video-toaster-4000-"))
    expect(composition.slots.values).not_to include(*ActiveAdmin::Themes::HaikuBeta6::COMPOSITION.slots.values)
    expect(composition.slots.values).not_to include(*ActiveAdmin::Themes::AROSZune::COMPOSITION.slots.values)
  end

  it "keeps action roles above generic controls in cascade order" do # rubocop:disable RSpec/ExampleLength
    source = described_class.source
    shared = ":where(.video-toaster-4000-form select, .video-toaster-4000-primary-action, " \
             ".video-toaster-4000-secondary-action)"
    primary = ".video-toaster-4000-workspace .video-toaster-4000-primary-action {"

    expect(source.index(shared)).to be < source.index(primary)
    expect(source).to include("#{primary}\n  background: linear-gradient(to bottom, var(--video-toaster-4000-amber)")
  end
end
