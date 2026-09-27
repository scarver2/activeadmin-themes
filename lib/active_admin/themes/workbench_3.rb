# lib/active_admin/themes/workbench_3.rb
# frozen_string_literal: true

require "active_admin/themes/composition"
require "active_admin/themes/recipes/workbench_3"
require "active_admin/themes/skin"
require "active_admin/themes/theme"

module ActiveAdmin
  module Themes
    module Workbench3
      SLOTS = {
        actions: "workbench-3-actions",
        data_region: "workbench-3-data-region",
        data_table: "workbench-3-data-table",
        footer: "workbench-3-footer",
        form: "workbench-3-form",
        help: "workbench-3-help",
        launcher: "workbench-3-launcher",
        launcher_art: "workbench-3-launcher-art",
        launcher_group: "workbench-3-launcher-group",
        navigation: "workbench-3-navigation",
        primary_action: "workbench-3-primary-action",
        primary_window: "workbench-3-primary-window",
        screen_header: "workbench-3-screen-header",
        secondary_action: "workbench-3-secondary-action",
        side_window: "workbench-3-side-window",
        status: "workbench-3-status",
        status_tag: "workbench-3-status-tag",
        wide_window: "workbench-3-wide-window",
        window: "workbench-3-window",
        window_actions: "workbench-3-window-actions",
        window_content: "workbench-3-window-content",
        window_header: "workbench-3-window-header",
        workspace: "workbench-3-workspace",
        workspace_grid: "workbench-3-workspace-grid"
      }.freeze
      SKIN = Skin.new(
        key: "workbench_3",
        name: "Workbench 3.x",
        description: "A fixed late-Commodore slate, white, black, and active-blue presentation " \
                     "with no invented dark variant.",
        manifest: Recipes::Workbench3::SKIN_MANIFEST
      )
      COMPOSITION = Composition.new(
        key: "workbench_3",
        name: "Workbench 3.x Workspace",
        description: "An AGA-era dithered work surface and active-window hierarchy adapted to accessible markup.",
        manifest: Recipes::Workbench3::COMPOSITION_MANIFEST,
        slots: SLOTS
      )

      module_function

      def theme
        Theme.new(
          key: "workbench_3",
          name: "Workbench 3.x",
          description: "A historically grounded Workbench 3.x composition for ActiveAdmin 4.",
          active_admin_requirement: [">= 4.0.0.beta22", "< 5"],
          recipe_version: "1",
          skin: SKIN,
          composition: COMPOSITION
        )
      end
    end
  end
end
