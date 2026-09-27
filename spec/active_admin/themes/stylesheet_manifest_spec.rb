# spec/active_admin/themes/stylesheet_manifest_spec.rb
# frozen_string_literal: true

require "spec_helper"

require "fileutils"
require "tmpdir"

require "active_admin/themes/stylesheet_manifest"

RSpec.describe ActiveAdmin::Themes::StylesheetManifest do
  let(:root) { Dir.mktmpdir("stylesheet-manifest") }
  let(:manifest) { described_class.new(root: root, parts: %w[foundation/tokens empty base]) }

  after { FileUtils.remove_entry(root) }

  before do
    FileUtils.mkdir_p(File.join(root, "foundation"))
    File.binwrite(File.join(root, "foundation", "tokens.css"), "tokens {}")
    File.binwrite(File.join(root, "empty.css"), "")
    File.binwrite(File.join(root, "base.css"), "base {}")
  end

  it "composes nonempty files in explicit order with deterministic bytes" do
    expect(manifest.parts).to eq(%w[foundation/tokens empty base])
    expect(Array.new(3) { manifest.source }).to all(eq("tokens {}\nbase {}"))
  end

  it "requires every declared file to exist" do
    manifest = described_class.new(root: root, parts: %w[missing])

    expect { manifest.source }.to raise_error(Errno::ENOENT)
  end

  it "rejects duplicate parts" do
    expect do
      described_class.new(root: root, parts: %w[base base])
    end.to raise_error(ArgumentError, "stylesheet parts must be unique")
  end

  ["/base", "../base", "./base", "a//base", "a/", "", 'a\\base', "C:base", "a\u0000b"].each do |part|
    it "rejects nonportable part #{part.inspect}" do
      expect do
        described_class.new(root: root, parts: [part])
      end.to raise_error(ArgumentError, "stylesheet parts must be normalized relative paths")
    end
  end
end
