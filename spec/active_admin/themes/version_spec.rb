# spec/active_admin/themes/version_spec.rb
# frozen_string_literal: true

require "spec_helper"
require "active_admin/themes/version"

RSpec.describe ActiveAdmin::Themes::VERSION do
  let(:semantic_version_pattern) do
    /\A(?:0|[1-9]\d*)\.(?:0|[1-9]\d*)\.(?:0|[1-9]\d*)
      (?:-(?:0|[1-9]\d*|\d*[A-Za-z-][0-9A-Za-z-]*)
        (?:\.(?:0|[1-9]\d*|\d*[A-Za-z-][0-9A-Za-z-]*))*)?
      (?:\+[0-9A-Za-z-]+(?:\.[0-9A-Za-z-]+)*)?\z/x
  end

  it "is a valid semantic version" do
    expect(ActiveAdmin::Themes::VERSION).to match(semantic_version_pattern)
    expect(Gem::Version.new(ActiveAdmin::Themes::VERSION).to_s).to eq(ActiveAdmin::Themes::VERSION)
  end

  it "rejects RubyGems-style dotted prerelease versions" do
    dotted_prereleases = %w[0.2.0.pre 0.2.0.beta1 0.2.0.rc1]

    expect(dotted_prereleases.grep(semantic_version_pattern)).to be_empty
  end
end
