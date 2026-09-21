# lib/active_admin/themes.rb
# frozen_string_literal: true

require "active_admin/themes/amigaos_4"
require "active_admin/themes/aros_zune"
require "active_admin/themes/composition"
require "active_admin/themes/mui"
require "active_admin/themes/registry"
require "active_admin/themes/skin"
require "active_admin/themes/stylesheet_manifest"
require "active_admin/themes/theme"
require "active_admin/themes/texas_bluebonnet"
require "active_admin/themes/v3"
require "active_admin/themes/version"
require "active_admin/themes/workbench_13"
require "active_admin/themes/workbench_2"
require "active_admin/themes/workbench_3"

module ActiveAdmin
  module Themes
    THEME_BUILDERS = [V3, TexasBluebonnet, Workbench13, Workbench2, Workbench3, Mui, AmigaOS4, AROSZune].freeze

    def self.registry
      Registry.new.tap do |registry|
        THEME_BUILDERS.each { |builder| registry.register(builder.theme) }
      end
    end
  end
end
