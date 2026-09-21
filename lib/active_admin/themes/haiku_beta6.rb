# lib/active_admin/themes/haiku_beta6.rb
# frozen_string_literal: true

require "active_admin/themes/composition"
require "active_admin/themes/recipes/haiku_beta6"
require "active_admin/themes/skin"
require "active_admin/themes/theme"

module ActiveAdmin
  module Themes
    module HaikuBeta6
      SLOTS = {
        actions: "haiku-beta6-actions",
        data_region: "haiku-beta6-data-region",
        data_table: "haiku-beta6-data-table",
        footer: "haiku-beta6-footer",
        form: "haiku-beta6-form",
        help: "haiku-beta6-help",
        launcher: "haiku-beta6-launcher",
        launcher_art: "haiku-beta6-launcher-art",
        launcher_group: "haiku-beta6-launcher-group",
        navigation: "haiku-beta6-navigation",
        primary_action: "haiku-beta6-primary-action",
        primary_window: "haiku-beta6-primary-window",
        screen_header: "haiku-beta6-screen-header",
        secondary_action: "haiku-beta6-secondary-action",
        side_window: "haiku-beta6-side-window",
        status: "haiku-beta6-status",
        status_tag: "haiku-beta6-status-tag",
        wide_window: "haiku-beta6-wide-window",
        window: "haiku-beta6-window",
        window_actions: "haiku-beta6-window-actions",
        window_content: "haiku-beta6-window-content",
        window_header: "haiku-beta6-window-header",
        workspace: "haiku-beta6-workspace",
        workspace_grid: "haiku-beta6-workspace-grid"
      }.freeze
      SKIN = Skin.new(
        key: "haiku_beta6",
        name: "Haiku beta6",
        description: "A clear gray, blue, and iconic yellow presentation derived from Haiku R1/beta6 defaults.",
        manifest: Recipes::HaikuBeta6::SKIN_MANIFEST
      )
      COMPOSITION = Composition.new(
        key: "haiku_beta6",
        name: "Haiku beta6 Tracker Workspace",
        description: "Tabbed windows, clean utility geometry, launchers, and dense Tracker-inspired data surfaces.",
        manifest: Recipes::HaikuBeta6::COMPOSITION_MANIFEST,
        slots: SLOTS
      )

      module_function

      def theme
        Theme.new(
          key: "haiku_beta6",
          name: "Haiku beta6",
          description: "A Haiku R1/beta6-inspired desktop composition for ActiveAdmin 4.",
          active_admin_requirement: [">= 4.0.0.beta22", "< 5"],
          recipe_version: "1",
          skin: SKIN,
          composition: COMPOSITION
        )
      end
    end
  end
end
