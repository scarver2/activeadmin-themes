# spec/active_admin/themes/recipes/texas_bluebonnet_spec.rb
# frozen_string_literal: true

require "spec_helper"
require "active_admin/themes/recipes/texas_bluebonnet"

RSpec.describe ActiveAdmin::Themes::Recipes::TexasBluebonnet do
  let(:expected_parts) do
    %w[
      foundation/tokens foundation/base components/navigation components/actions
      components/data components/support surfaces/workspace hardening/responsive
      hardening/preferences
    ]
  end

  it "defines explicit skin and composition manifests in cascade order" do
    expect(described_class::PARTS).to eq(expected_parts)
    expect(described_class::SKIN_PARTS + described_class::COMPOSITION_PARTS).to eq(expected_parts)
  end

  it "composes the approved reusable Bluebonnet presentation contract deterministically" do
    source = described_class.source

    expect(Array.new(3) { described_class.source }).to all(eq(source))
    expect(source).to include('body[data-activeadmin-theme="texas-bluebonnet"]')
    expect(source).to include(".bluebonnet-workspace", ".bluebonnet-data-table", "prefers-reduced-motion")
  end

  it "does not package Showcase behavior or implementation hooks" do
    expect(described_class.source).not_to include(
      "AccountExplorer", "data-testid", "showcase-", "admin_", "Rails", "React"
    )
  end
end
