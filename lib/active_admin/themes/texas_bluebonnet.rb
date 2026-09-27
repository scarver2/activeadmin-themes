# lib/active_admin/themes/texas_bluebonnet.rb
# frozen_string_literal: true

require "active_admin/themes/composition"
require "active_admin/themes/recipes/texas_bluebonnet"
require "active_admin/themes/skin"
require "active_admin/themes/theme"

module ActiveAdmin
  module Themes
    module TexasBluebonnet
      SLOTS = {
        action: "bluebonnet-action",
        context: "bluebonnet-context",
        current: "bluebonnet-current",
        data_heading: "bluebonnet-data-heading",
        data_surface: "bluebonnet-data-surface",
        data_table: "bluebonnet-data-table",
        eyebrow: "bluebonnet-eyebrow",
        footnote: "bluebonnet-footnote",
        heading: "bluebonnet-heading",
        main: "bluebonnet-data",
        pagination: "bluebonnet-pagination",
        primary_action: "bluebonnet-primary-action",
        source: "bluebonnet-source",
        support: "bluebonnet-support",
        toolbar: "bluebonnet-toolbar",
        toolbar_surface: "bluebonnet-toolbar-surface",
        workspace: "bluebonnet-workspace",
        workspace_bar: "bluebonnet-workspace-bar",
        workspace_content: "bluebonnet-content"
      }.freeze
      SKIN = Skin.new(
        key: :texas_bluebonnet,
        name: "Texas Bluebonnet",
        description: "A warm cream and confident navy semantic palette with accessible light and dark values.",
        manifest: Recipes::TexasBluebonnet::SKIN_MANIFEST
      )
      COMPOSITION = Composition.new(
        key: :texas_bluebonnet,
        name: "Texas Bluebonnet Workspace",
        description: "A full-viewport editorial workspace with on-demand navigation and continuous data surfaces.",
        manifest: Recipes::TexasBluebonnet::COMPOSITION_MANIFEST,
        slots: SLOTS
      )

      module_function

      def theme
        Theme.new(
          key: :texas_bluebonnet,
          name: "Texas Bluebonnet",
          description: "A professional full-workspace ActiveAdmin theme inspired by Texas clarity and craft.",
          active_admin_requirement: [">= 4.0.0.beta22", "< 5"],
          recipe_version: "1",
          skin: SKIN,
          composition: COMPOSITION
        )
      end
    end
  end
end
