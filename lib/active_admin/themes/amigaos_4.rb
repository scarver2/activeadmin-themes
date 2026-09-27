# lib/active_admin/themes/amigaos_4.rb
# frozen_string_literal: true

require "active_admin/themes/composition"
require "active_admin/themes/recipes/amigaos_4"
require "active_admin/themes/skin"
require "active_admin/themes/theme"

module ActiveAdmin
  module Themes
    module AmigaOS4
      SLOTS = {
        actions: "amigaos-4-actions",
        data_region: "amigaos-4-data-region",
        data_table: "amigaos-4-data-table",
        footer: "amigaos-4-footer",
        form: "amigaos-4-form",
        help: "amigaos-4-help",
        launcher: "amigaos-4-launcher",
        launcher_art: "amigaos-4-launcher-art",
        launcher_group: "amigaos-4-launcher-group",
        navigation: "amigaos-4-navigation",
        primary_action: "amigaos-4-primary-action",
        primary_window: "amigaos-4-primary-window",
        screen_header: "amigaos-4-screen-header",
        secondary_action: "amigaos-4-secondary-action",
        side_window: "amigaos-4-side-window",
        status: "amigaos-4-status",
        status_tag: "amigaos-4-status-tag",
        wide_window: "amigaos-4-wide-window",
        window: "amigaos-4-window",
        window_actions: "amigaos-4-window-actions",
        window_content: "amigaos-4-window-content",
        window_header: "amigaos-4-window-header",
        workspace: "amigaos-4-workspace",
        workspace_grid: "amigaos-4-workspace-grid"
      }.freeze
      SKIN = Skin.new(
        key: "amigaos_4",
        name: "AmigaOS 4",
        description: "A cool blue, pearl, and graphite presentation derived from AmigaOS 4's " \
                     "configurable ReAction and Workbench vocabulary.",
        manifest: Recipes::AmigaOS4::SKIN_MANIFEST
      )
      COMPOSITION = Composition.new(
        key: "amigaos_4",
        name: "AmigaOS 4 ReAction Workspace",
        description: "Adaptive ReAction groups, polished window chrome, launchers, and a shared public workspace.",
        manifest: Recipes::AmigaOS4::COMPOSITION_MANIFEST,
        slots: SLOTS
      )

      module_function

      def theme
        Theme.new(
          key: "amigaos_4",
          name: "AmigaOS 4",
          description: "A historically grounded AmigaOS 4.1 composition for ActiveAdmin 4.",
          active_admin_requirement: [">= 4.0.0.beta22", "< 5"],
          recipe_version: "1",
          skin: SKIN,
          composition: COMPOSITION
        )
      end
    end
  end
end
