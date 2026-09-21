# lib/active_admin/themes/workbench_13.rb
# frozen_string_literal: true

require "active_admin/themes/composition"
require "active_admin/themes/recipes/workbench_13"
require "active_admin/themes/skin"
require "active_admin/themes/theme"

module ActiveAdmin
  module Themes
    module Workbench13
      SLOTS = {
        actions: "workbench-13-actions",
        data_region: "workbench-13-data-region",
        data_table: "workbench-13-data-table",
        footer: "workbench-13-footer",
        form: "workbench-13-form",
        help: "workbench-13-help",
        launcher: "workbench-13-launcher",
        launcher_art: "workbench-13-launcher-art",
        launcher_group: "workbench-13-launcher-group",
        navigation: "workbench-13-navigation",
        primary_action: "workbench-13-primary-action",
        primary_window: "workbench-13-primary-window",
        screen_header: "workbench-13-screen-header",
        secondary_action: "workbench-13-secondary-action",
        side_window: "workbench-13-side-window",
        status: "workbench-13-status",
        status_tag: "workbench-13-status-tag",
        wide_window: "workbench-13-wide-window",
        window: "workbench-13-window",
        window_actions: "workbench-13-window-actions",
        window_content: "workbench-13-window-content",
        window_header: "workbench-13-window-header",
        workspace: "workbench-13-workspace",
        workspace_grid: "workbench-13-workspace-grid"
      }.freeze
      SKIN = Skin.new(
        key: "workbench_13",
        name: "Workbench 1.3",
        description: "A fixed historical blue, white, ink, and orange presentation with no invented dark variant.",
        manifest: Recipes::Workbench13::SKIN_MANIFEST
      )
      COMPOSITION = Composition.new(
        key: "workbench_13",
        name: "Workbench 1.3 Workspace",
        description: "A compact drawer-and-window workspace adapted to accessible modern administrative markup.",
        manifest: Recipes::Workbench13::COMPOSITION_MANIFEST,
        slots: SLOTS
      )

      module_function

      def theme
        Theme.new(
          key: "workbench_13",
          name: "Workbench 1.3",
          description: "A historically grounded Workbench 1.3 composition for ActiveAdmin 4.",
          active_admin_requirement: [">= 4.0.0.beta22", "< 5"],
          recipe_version: "1",
          skin: SKIN,
          composition: COMPOSITION
        )
      end
    end
  end
end
