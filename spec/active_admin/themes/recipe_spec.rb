# spec/active_admin/themes/recipe_spec.rb
# frozen_string_literal: true

require "spec_helper"

require "fileutils"
require "tmpdir"

require "active_admin/themes/recipe"

RSpec.describe ActiveAdmin::Themes::Recipe do
  subject(:recipe) { described_class.new(root: root, entrypoint: "admin.css", active_admin_version: "4.0.0.beta22") }

  let(:root) { Dir.mktmpdir("theme-recipe") }

  before { File.write(File.join(root, "admin.css"), '@import "tailwindcss";') }
  after { FileUtils.remove_entry(root) }

  it "installs a packaged recipe once and reports repeat installation" do
    expect(recipe.status).to eq(:missing)
    expect(recipe.install).to eq(:created)
    expect(recipe.install).to eq(:identical)
    expect(recipe.status).to eq(:identical)
  end

  it "installs exactly the composed canonical CSS bytes" do
    recipe.install
    expect(File.binread(File.join(root, recipe.destination))).to eq(ActiveAdmin::Themes::Recipes::V3.source)
  end

  it "composes identical bytes on repeated calls" do
    original = ActiveAdmin::Themes::Recipes::V3.source
    expect(Array.new(3) { ActiveAdmin::Themes::Recipes::V3.source }).to all(eq(original))
  end

  it "leaves composed CSS bytes unchanged on repeated installation" do
    recipe.install
    original = File.binread(File.join(root, recipe.destination))
    recipe.install
    expect(File.binread(File.join(root, recipe.destination))).to eq(original)
  end

  it "preserves customization and the host entrypoint" do
    recipe.install
    File.write(File.join(root, recipe.destination), "custom")
    expect { recipe.install }.to raise_error(described_class::Conflict)
    expect(File.read(File.join(root, "admin.css"))).to eq('@import "tailwindcss";')
  end

  it "reports explicit import and build instructions" do
    expect(recipe.instructions).to include('@import "./active_admin_v3.css";', "admin.css", "existing CSS build")
  end

  # The full boundary assertion intentionally keeps install result, bytes and instructions together.
  it "installs Texas Bluebonnet through the same application-owned boundary" do # rubocop:disable RSpec/ExampleLength
    bluebonnet = described_class.new(
      root: root, entrypoint: "admin.css", active_admin_version: "4.0.0.beta22", key: :texas_bluebonnet
    )

    result = bluebonnet.install
    installed = File.binread(File.join(root, bluebonnet.destination))

    expect([result, bluebonnet.destination]).to eq([:created, "active_admin_texas_bluebonnet.css"])
    expect(installed).to eq(ActiveAdmin::Themes::TexasBluebonnet.theme.source)
    expect(bluebonnet.instructions).to include('@import "./active_admin_texas_bluebonnet.css";')
  end

  # The complete installer boundary intentionally retains setup and its byte assertion together.
  it "installs Workbench 1.3 through the same application-owned boundary" do # rubocop:disable RSpec/ExampleLength
    workbench = described_class.new(
      root: root, entrypoint: "admin.css", active_admin_version: "4.0.0.beta22", key: "workbench_13"
    )

    expect(workbench.install).to eq(:created)
    expect(File.binread(File.join(root, workbench.destination))).to eq(ActiveAdmin::Themes::Workbench13.theme.source)
    expect(workbench.instructions).to include('@import "./active_admin_workbench_13.css";')
  end

  # The complete installer boundary intentionally retains setup and its byte assertion together.
  it "installs Workbench 2.x through the same application-owned boundary" do # rubocop:disable RSpec/ExampleLength
    workbench = described_class.new(
      root: root, entrypoint: "admin.css", active_admin_version: "4.0.0.beta22", key: "workbench_2"
    )

    expect(workbench.install).to eq(:created)
    expect(File.binread(File.join(root, workbench.destination))).to eq(ActiveAdmin::Themes::Workbench2.theme.source)
    expect(workbench.instructions).to include('@import "./active_admin_workbench_2.css";')
  end

  # The complete installer boundary intentionally retains setup and its byte assertion together.
  it "installs Workbench 3.x through the same application-owned boundary" do # rubocop:disable RSpec/ExampleLength
    workbench = described_class.new(
      root: root, entrypoint: "admin.css", active_admin_version: "4.0.0.beta22", key: "workbench_3"
    )

    expect(workbench.install).to eq(:created)
    expect(File.binread(File.join(root, workbench.destination))).to eq(ActiveAdmin::Themes::Workbench3.theme.source)
    expect(workbench.instructions).to include('@import "./active_admin_workbench_3.css";')
  end

  # The complete installer boundary intentionally retains setup and its byte assertion together.
  it "installs MUI through the same application-owned boundary" do # rubocop:disable RSpec/ExampleLength
    mui = described_class.new(
      root: root, entrypoint: "admin.css", active_admin_version: "4.0.0.beta22", key: "mui"
    )

    expect(mui.install).to eq(:created)
    expect(File.binread(File.join(root, mui.destination))).to eq(ActiveAdmin::Themes::Mui.theme.source)
    expect(mui.instructions).to include('@import "./active_admin_mui.css";')
  end

  # The complete installer boundary intentionally retains setup and its byte assertion together.
  it "installs AROS/Zune through the same application-owned boundary" do # rubocop:disable RSpec/ExampleLength
    aros_zune = described_class.new(
      root: root, entrypoint: "admin.css", active_admin_version: "4.0.0.beta22", key: "aros_zune"
    )

    expect(aros_zune.install).to eq(:created)
    expect(File.binread(File.join(root, aros_zune.destination))).to eq(ActiveAdmin::Themes::AROSZune.theme.source)
    expect(aros_zune.instructions).to include('@import "./active_admin_aros_zune.css";')
  end

  # The complete installer boundary intentionally retains setup and its byte assertion together.
  it "installs Haiku beta6 through the same application-owned boundary" do # rubocop:disable RSpec/ExampleLength
    haiku = described_class.new(
      root: root, entrypoint: "admin.css", active_admin_version: "4.0.0.beta22", key: "haiku_beta6"
    )

    expect(haiku.install).to eq(:created)
    expect(File.binread(File.join(root, haiku.destination))).to eq(ActiveAdmin::Themes::HaikuBeta6.theme.source)
    expect(haiku.instructions).to include('@import "./active_admin_haiku_beta6.css";')
  end

  it "requires an existing entrypoint" do
    File.unlink(File.join(root, "admin.css"))
    expect { recipe }.to raise_error(ArgumentError, "styling entrypoint does not exist")
  end

  it "rejects a non-Tailwind entrypoint" do
    File.write(File.join(root, "admin.css"), "body {}")
    expect { recipe }.to raise_error(ArgumentError, "select the existing Tailwind CSS entrypoint")
  end

  it "rechecks a changed entrypoint before installing" do
    recipe
    File.write(File.join(root, "admin.css"), "body {}")
    expect { recipe.install }.to raise_error(ArgumentError)
    expect(Dir.children(root)).to eq(["admin.css"])
  end
end
