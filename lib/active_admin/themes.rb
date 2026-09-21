# lib/active_admin/themes.rb
# frozen_string_literal: true

require "active_admin/themes/composition"
require "active_admin/themes/registry"
require "active_admin/themes/skin"
require "active_admin/themes/stylesheet_manifest"
require "active_admin/themes/theme"
require "active_admin/themes/texas_bluebonnet"
require "active_admin/themes/v3"
require "active_admin/themes/version"
require "active_admin/themes/workbench_13"

module ActiveAdmin
  module Themes
    def self.registry
      Registry.new.tap do |registry|
        registry.register(V3.theme)
        registry.register(TexasBluebonnet.theme)
        registry.register(Workbench13.theme)
      end
    end
  end
end
