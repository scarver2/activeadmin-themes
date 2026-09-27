# lib/active_admin/themes/recipes/texas_bluebonnet.rb
# frozen_string_literal: true

require "active_admin/themes/stylesheet_manifest"

module ActiveAdmin
  module Themes
    module Recipes
      module TexasBluebonnet
        SKIN_PARTS = %w[foundation/tokens].freeze
        COMPOSITION_PARTS = %w[
          foundation/base
          components/navigation
          components/actions
          components/data
          components/support
          surfaces/workspace
          hardening/responsive
          hardening/preferences
        ].freeze
        PARTS = (SKIN_PARTS + COMPOSITION_PARTS).freeze
        ROOT = File.expand_path("texas_bluebonnet", __dir__).freeze
        SKIN_MANIFEST = StylesheetManifest.new(root: ROOT, parts: SKIN_PARTS)
        COMPOSITION_MANIFEST = StylesheetManifest.new(root: ROOT, parts: COMPOSITION_PARTS)

        module_function

        def source
          [SKIN_MANIFEST.source, COMPOSITION_MANIFEST.source].reject(&:empty?).join("\n")
        end
      end
    end
  end
end
