# spec/active_admin/themes/registry_spec.rb
# frozen_string_literal: true

require "spec_helper"
require "activeadmin-themes"

RSpec.describe ActiveAdmin::Themes::Registry do
  subject(:registry) { described_class.new }

  let(:theme) { ActiveAdmin::Themes::V3.theme }

  it "registers and fetches a theme by string or symbol key" do
    registry.register(theme)
    expect(registry.fetch(:v3)).to be(theme)
    expect(registry.fetch("v3")).to be(theme)
    expect(registry.keys).to eq([:v3])
  end

  it "rejects duplicate keys" do
    registry.register(theme)
    expect { registry.register(theme) }.to raise_error(ArgumentError, "theme :v3 is already registered")
  end

  it "enumerates registered themes" do
    registry.register(theme)
    expect(registry.map(&:key)).to eq([:v3])
  end

  it "exposes the default v3 catalog" do
    keys = %w[v3 texas_bluebonnet workbench_13 workbench_2 workbench_3 mui amigaos_4]

    expect(keys.map { |key| ActiveAdmin::Themes.registry.fetch(key).key.to_s }).to eq(keys)
  end

  it "rejects unknown theme keys" do
    expect { registry.fetch(:unknown) }.to raise_error(KeyError)
  end

  it "gives callers independent catalogs" do
    first = ActiveAdmin::Themes.registry
    second = ActiveAdmin::Themes.registry
    first.register(theme.with(key: :custom))
    expect(second.keys.map(&:to_s)).to eq(%w[v3 texas_bluebonnet workbench_13 workbench_2 workbench_3 mui amigaos_4])
  end
end
