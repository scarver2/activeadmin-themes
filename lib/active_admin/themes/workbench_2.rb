# lib/active_admin/themes/workbench_2.rb
# frozen_string_literal: true

require "active_admin/themes/composition"
require "active_admin/themes/recipes/workbench_2"
require "active_admin/themes/skin"
require "active_admin/themes/theme"

module ActiveAdmin
  module Themes
    module Workbench2
      SLOTS = {
        actions: "workbench-2-actions",
        data_region: "workbench-2-data-region",
        data_table: "workbench-2-data-table",
        footer: "workbench-2-footer",
        form: "workbench-2-form",
        help: "workbench-2-help",
        launcher: "workbench-2-launcher",
        launcher_art: "workbench-2-launcher-art",
        launcher_group: "workbench-2-launcher-group",
        navigation: "workbench-2-navigation",
        primary_action: "workbench-2-primary-action",
        primary_window: "workbench-2-primary-window",
        screen_header: "workbench-2-screen-header",
        secondary_action: "workbench-2-secondary-action",
        side_window: "workbench-2-side-window",
        status: "workbench-2-status",
        status_tag: "workbench-2-status-tag",
        wide_window: "workbench-2-wide-window",
        window: "workbench-2-window",
        window_actions: "workbench-2-window-actions",
        window_content: "workbench-2-window-content",
        window_header: "workbench-2-window-header",
        workspace: "workbench-2-workspace",
        workspace_grid: "workbench-2-workspace-grid"
      }.freeze
      SKIN = Skin.new(
        key: "workbench_2",
        name: "Workbench 2.x",
        description: "A fixed historical gray, black, white, and blue four-pen presentation " \
                     "with no invented dark variant.",
        manifest: Recipes::Workbench2::SKIN_MANIFEST
      )
      COMPOSITION = Composition.new(
        key: "workbench_2",
        name: "Workbench 2.x Workspace",
        description: "A compact pseudo-3D work surface adapted to accessible modern administrative markup.",
        manifest: Recipes::Workbench2::COMPOSITION_MANIFEST,
        slots: SLOTS
      )

      module_function

      def theme
        Theme.new(
          key: "workbench_2",
          name: "Workbench 2.x",
          description: "A historically grounded Workbench 2.x composition for ActiveAdmin 4.",
          active_admin_requirement: [">= 4.0.0.beta22", "< 5"],
          recipe_version: "1",
          skin: SKIN,
          composition: COMPOSITION
        )
      end
    end
  end
end
