# lib/active_admin/themes/mui.rb
# frozen_string_literal: true

require "active_admin/themes/composition"
require "active_admin/themes/recipes/mui"
require "active_admin/themes/skin"
require "active_admin/themes/theme"

module ActiveAdmin
  module Themes
    module Mui
      SLOTS = {
        actions: "mui-actions",
        data_region: "mui-data-region",
        data_table: "mui-data-table",
        footer: "mui-footer",
        form: "mui-form",
        help: "mui-help",
        launcher: "mui-launcher",
        launcher_art: "mui-launcher-art",
        launcher_group: "mui-launcher-group",
        navigation: "mui-navigation",
        primary_action: "mui-primary-action",
        primary_window: "mui-primary-window",
        screen_header: "mui-screen-header",
        secondary_action: "mui-secondary-action",
        side_window: "mui-side-window",
        status: "mui-status",
        status_tag: "mui-status-tag",
        wide_window: "mui-wide-window",
        window: "mui-window",
        window_actions: "mui-window-actions",
        window_content: "mui-window-content",
        window_header: "mui-window-header",
        workspace: "mui-workspace",
        workspace_grid: "mui-workspace-grid"
      }.freeze
      SKIN = Skin.new(
        key: "mui",
        name: "MUI",
        description: "A user-tunable silver, charcoal, and teal presentation derived from MUI's " \
                     "configurable object vocabulary.",
        manifest: Recipes::Mui::SKIN_MANIFEST
      )
      COMPOSITION = Composition.new(
        key: "mui",
        name: "MUI Object Workspace",
        description: "Font-sensitive groups, registers, framed objects, and adaptive application layout.",
        manifest: Recipes::Mui::COMPOSITION_MANIFEST,
        slots: SLOTS
      )

      module_function

      def theme
        Theme.new(
          key: "mui",
          name: "MUI",
          description: "A historically grounded MUI toolkit composition for ActiveAdmin 4.",
          active_admin_requirement: [">= 4.0.0.beta22", "< 5"],
          recipe_version: "1",
          skin: SKIN,
          composition: COMPOSITION
        )
      end
    end
  end
end
