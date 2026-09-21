# lib/active_admin/themes/v3.rb
# frozen_string_literal: true

require "active_admin/themes/composition"
require "active_admin/themes/recipes/v3"
require "active_admin/themes/skin"
require "active_admin/themes/theme"

module ActiveAdmin
  module Themes
    module V3
      SKIN = Skin.new(
        key: :v3,
        name: "ActiveAdmin V3",
        description: "The restrained gray and blue semantic palette associated with ActiveAdmin 3.5.",
        manifest: Recipes::V3::SKIN_MANIFEST
      )
      COMPOSITION = Composition.new(
        key: :v3,
        name: "ActiveAdmin V3",
        description: "Compact operator-focused ActiveAdmin hierarchy adapted to the ActiveAdmin 4 DOM.",
        manifest: Recipes::V3::COMPOSITION_MANIFEST,
        slots: {}
      )

      module_function

      def theme
        Theme.new(
          key: :v3,
          name: "ActiveAdmin V3",
          description: "AA3.5-inspired visual discipline on ActiveAdmin 4's modern foundation.",
          active_admin_requirement: [">= 4.0.0.beta22", "< 5"],
          recipe_version: "2",
          skin: SKIN,
          composition: COMPOSITION
        )
      end
    end
  end
end
