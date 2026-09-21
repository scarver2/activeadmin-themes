# lib/active_admin/themes/aros_zune.rb
# frozen_string_literal: true

require "active_admin/themes/composition"
require "active_admin/themes/recipes/aros_zune"
require "active_admin/themes/skin"
require "active_admin/themes/theme"

module ActiveAdmin
  module Themes
    module AROSZune
      SLOTS = {
        actions: "aros-zune-actions",
        data_region: "aros-zune-data-region",
        data_table: "aros-zune-data-table",
        footer: "aros-zune-footer",
        form: "aros-zune-form",
        help: "aros-zune-help",
        launcher: "aros-zune-launcher",
        launcher_art: "aros-zune-launcher-art",
        launcher_group: "aros-zune-launcher-group",
        navigation: "aros-zune-navigation",
        primary_action: "aros-zune-primary-action",
        primary_window: "aros-zune-primary-window",
        screen_header: "aros-zune-screen-header",
        secondary_action: "aros-zune-secondary-action",
        side_window: "aros-zune-side-window",
        status: "aros-zune-status",
        status_tag: "aros-zune-status-tag",
        wide_window: "aros-zune-wide-window",
        window: "aros-zune-window",
        window_actions: "aros-zune-window-actions",
        window_content: "aros-zune-window-content",
        window_header: "aros-zune-window-header",
        workspace: "aros-zune-workspace",
        workspace_grid: "aros-zune-workspace-grid"
      }.freeze
      SKIN = Skin.new(
        key: "aros_zune",
        name: "AROS/Zune",
        description: "A warm cream, blue, and amber presentation grounded in AROS's open-source Zune defaults.",
        manifest: Recipes::AROSZune::SKIN_MANIFEST
      )
      COMPOSITION = Composition.new(
        key: "aros_zune",
        name: "AROS/Zune Object Workspace",
        description: "Adaptive Zune groups, beveled object frames, launchers, and an AROS-inspired public workspace.",
        manifest: Recipes::AROSZune::COMPOSITION_MANIFEST,
        slots: SLOTS
      )

      module_function

      def theme
        Theme.new(
          key: "aros_zune",
          name: "AROS/Zune",
          description: "An open-source AROS/Zune composition for ActiveAdmin 4.",
          active_admin_requirement: [">= 4.0.0.beta22", "< 5"],
          recipe_version: "1",
          skin: SKIN,
          composition: COMPOSITION
        )
      end
    end
  end
end
