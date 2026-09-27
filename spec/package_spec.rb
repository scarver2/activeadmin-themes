# spec/package_spec.rb
# frozen_string_literal: true

require "spec_helper"
require "open3"
require "rubygems/package"
require "tmpdir"

# One end-to-end process boundary intentionally keeps its setup and assertions together.
# rubocop:disable-next RSpec/DescribeClass
RSpec.describe "Built recipe package" do
  let(:packaged_concerns) do
    v3 = %w[
      foundation/tokens foundation/base
      components/navigation components/tables components/filters components/forms components/panels components/feedback
      surfaces/login surfaces/dashboard
      hardening/responsive hardening/preferences
    ].map { |part| "lib/active_admin/themes/recipes/v3/#{part}.css" }
    bluebonnet = %w[
      foundation/tokens foundation/base
      components/navigation components/actions components/data components/support
      surfaces/workspace hardening/responsive hardening/preferences
    ].map { |part| "lib/active_admin/themes/recipes/texas_bluebonnet/#{part}.css" }
    workbench = %w[
      foundation/tokens foundation/base
      components/navigation components/launchers components/windows components/data components/forms
      surfaces/workspace hardening/responsive hardening/preferences
    ].map { |part| "lib/active_admin/themes/recipes/workbench_13/#{part}.css" }
    workbench2 = %w[
      foundation/tokens foundation/base
      components/navigation components/launchers components/windows components/data components/forms
      surfaces/workspace hardening/responsive hardening/preferences
    ].map { |part| "lib/active_admin/themes/recipes/workbench_2/#{part}.css" }
    workbench3 = %w[
      foundation/tokens foundation/base
      components/navigation components/launchers components/windows components/data components/forms
      surfaces/workspace hardening/responsive hardening/preferences
    ].map { |part| "lib/active_admin/themes/recipes/workbench_3/#{part}.css" }
    mui = %w[
      foundation/tokens foundation/base
      components/navigation components/launchers components/windows components/data components/forms
      surfaces/workspace hardening/responsive hardening/preferences
    ].map { |part| "lib/active_admin/themes/recipes/mui/#{part}.css" }
    v3 + bluebonnet + workbench + workbench2 + workbench3 + mui
  end

  # rubocop:disable-next RSpec/ExampleLength
  it "ships and installs the recipe outside the source checkout" do
    Dir.mktmpdir("theme-package") do |directory|
      specification = Gem::Specification.load("activeadmin-themes.gemspec")
      archive = Gem::Package.build(specification, false, false, File.join(directory, "theme.gem"))
      package = Gem::Package.new(archive)
      concern_files = package.contents.grep(
        %r{\Alib/active_admin/themes/recipes/(?:v3|texas_bluebonnet|workbench_13|workbench_2|workbench_3|mui)/.*\.css\z}
      )
      expect(concern_files).to match_array(packaged_concerns)
      package.extract_files(File.join(directory, "unpacked"))
      output, status = Open3.capture2e(
        RbConfig.ruby, "-I#{directory}/unpacked/lib", "-e", <<~RUBY, chdir: directory
          require "active_admin/themes/recipe"
          File.write("admin.css", '@import "tailwindcss";')
          abort "wrong source" unless $LOADED_FEATURES.any? { |path| path.include?("unpacked/lib/active_admin/themes/recipe.rb") }
          ActiveAdmin::Themes.registry.each do |theme|
            recipe = ActiveAdmin::Themes::Recipe.new(root: Dir.pwd, entrypoint: "admin.css",
              active_admin_version: "4.0.0.beta22", key: theme.key)
            composed = theme.source
            abort "nondeterministic composition" unless theme.source == composed
            abort "install failed" unless recipe.install == :created && recipe.install == :identical
            abort "installed CSS differs" unless File.binread("active_admin_\#{theme.key}.css") == composed && !composed.empty?
          end
        RUBY
      )
      expect(status.success?).to be(true), output
    end
  end
end
