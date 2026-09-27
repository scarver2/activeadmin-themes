# spec/active_admin/themes/theme_spec.rb
# frozen_string_literal: true

require "spec_helper"
require "active_admin/themes"

RSpec.describe ActiveAdmin::Themes::Theme do
  subject(:theme) { ActiveAdmin::Themes::V3.theme }

  let(:custom_skin) do
    ActiveAdmin::Themes::Skin.new(
      key: "custom", name: :Custom, description: :Palette,
      manifest: instance_double(ActiveAdmin::Themes::StylesheetManifest, source: "tokens {}")
    )
  end
  let(:custom_composition) do
    ActiveAdmin::Themes::Composition.new(
      key: "workspace", name: :Workspace, description: :Layout,
      manifest: instance_double(ActiveAdmin::Themes::StylesheetManifest, source: "layout {}"),
      slots: { "main" => :workspace }
    )
  end
  let(:custom_theme) do
    described_class.new(
      key: "custom", name: :Custom, description: :Theme, active_admin_requirement: ">= 4",
      recipe_version: 1, skin: custom_skin, composition: custom_composition
    )
  end

  it "normalizes immutable theme metadata" do
    expect([theme.key, theme.name, theme.recipe_version]).to eq([:v3, "ActiveAdmin V3", "2"])
    expect([theme.skin, theme.composition]).to eq([ActiveAdmin::Themes::V3::SKIN, ActiveAdmin::Themes::V3::COMPOSITION])
    expect(theme).to be_frozen
  end

  it "composes its skin before its composition" do
    expect(theme.source).to eq(ActiveAdmin::Themes::Recipes::V3.source)
  end

  it "supports independently reusable skins and compositions" do
    expect(custom_theme.source).to eq("tokens {}\nlayout {}")
    expect(custom_composition.class_for("main")).to eq("workspace")
    expect([custom_skin.key, custom_skin.name, custom_skin.description]).to eq([:custom, "Custom", "Palette"])
    expect([custom_composition.key, custom_composition.name]).to eq([:workspace, "Workspace"])
    expect(custom_theme.recipe_version).to eq("1")
  end

  it "rejects an unknown composition slot" do
    expect { custom_composition.class_for(:missing) }.to raise_error(KeyError)
  end

  it "does not add a separator when either theme layer is empty" do
    empty = instance_double(ActiveAdmin::Themes::Skin, source: "")
    populated = instance_double(ActiveAdmin::Themes::Composition, source: "layout {}")
    custom = theme.with(skin: empty, composition: populated)

    expect(custom.source).to eq("layout {}")
  end

  it "reports supported ActiveAdmin versions" do
    expect(theme).to be_supports("4.0.0.beta22")
    expect(theme).to be_supports("4.1.0")
    expect(theme).not_to be_supports("3.5.0")
    expect(theme).not_to be_supports("5.0.0")
  end

  it "registers Texas Bluebonnet as a full theme" do
    bluebonnet = ActiveAdmin::Themes::TexasBluebonnet.theme

    expect(bluebonnet.key).to eq(:texas_bluebonnet)
    expect(bluebonnet.skin.key).to eq(:texas_bluebonnet)
    expect(bluebonnet.composition.class_for(:workspace)).to eq("bluebonnet-workspace")
    expect(bluebonnet.source).to eq(ActiveAdmin::Themes::Recipes::TexasBluebonnet.source)
  end

  it "exposes Bluebonnet's continuous toolbar and primary action roles" do
    composition = ActiveAdmin::Themes::TexasBluebonnet::COMPOSITION

    expect(composition.class_for(:toolbar_surface)).to eq("bluebonnet-toolbar-surface")
    expect(composition.class_for(:primary_action)).to eq("bluebonnet-primary-action")
    expect(composition.class_for(:data_heading)).to eq("bluebonnet-data-heading")
  end

  # This public metadata contract intentionally keeps identity, slots, and source together.
  it "registers Workbench 1.3 as a fixed-presentation full theme" do # rubocop:disable RSpec/ExampleLength
    workbench = ActiveAdmin::Themes::Workbench13.theme

    expect([workbench.key, workbench.skin.key].map(&:to_s)).to eq(%w[workbench_13 workbench_13])
    expect(workbench.composition.slots.values_at(:launcher_art, :primary_window)).to eq(
      %w[workbench-13-launcher-art workbench-13-primary-window]
    )
    expect(workbench.source).to eq(ActiveAdmin::Themes::Recipes::Workbench13.source)
  end

  # This public metadata contract intentionally keeps identity, slots, and source together.
  it "registers Workbench 2.x as an independent fixed-presentation full theme" do # rubocop:disable RSpec/ExampleLength
    workbench = ActiveAdmin::Themes::Workbench2.theme

    expect([workbench.key, workbench.skin.key].map(&:to_s)).to eq(%w[workbench_2 workbench_2])
    expect(workbench.composition.slots.values_at(:launcher_art, :primary_window)).to eq(
      %w[workbench-2-launcher-art workbench-2-primary-window]
    )
    expect(workbench.source).to eq(ActiveAdmin::Themes::Recipes::Workbench2.source)
  end
end
