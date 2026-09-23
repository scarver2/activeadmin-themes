# lib/active_admin/themes/mercury_flight.rb
# frozen_string_literal: true

require "active_admin/themes/composition"
require "active_admin/themes/recipes/mercury_flight"
require "active_admin/themes/skin"
require "active_admin/themes/theme"

module ActiveAdmin
  module Themes
    module MercuryFlight
      SLOTS = {
        actions: "mercury-flight-actions",
        data_region: "mercury-flight-data-region",
        data_table: "mercury-flight-data-table",
        footer: "mercury-flight-footer",
        form: "mercury-flight-form",
        help: "mercury-flight-help",
        launcher: "mercury-flight-launcher",
        launcher_art: "mercury-flight-launcher-art",
        launcher_group: "mercury-flight-launcher-group",
        navigation: "mercury-flight-navigation",
        primary_action: "mercury-flight-primary-action",
        primary_window: "mercury-flight-primary-window",
        screen_header: "mercury-flight-screen-header",
        secondary_action: "mercury-flight-secondary-action",
        side_window: "mercury-flight-side-window",
        status: "mercury-flight-status",
        status_tag: "mercury-flight-status-tag",
        wide_window: "mercury-flight-wide-window",
        window: "mercury-flight-window",
        window_actions: "mercury-flight-window-actions",
        window_content: "mercury-flight-window-content",
        window_header: "mercury-flight-window-header",
        workspace: "mercury-flight-workspace",
        workspace_grid: "mercury-flight-workspace-grid"
      }.freeze
      SKIN = Skin.new(
        key: "mercury_flight",
        name: "Mercury Flight",
        description: "An oxblood, paper-white, charcoal, and signal-coral campaign operations palette.",
        manifest: Recipes::MercuryFlight::SKIN_MANIFEST
      )
      COMPOSITION = Composition.new(
        key: "mercury_flight",
        name: "Mercury Flight Campaign Console",
        description: "Compact navigation, campaign tables, action controls, and contextual operations support.",
        manifest: Recipes::MercuryFlight::COMPOSITION_MANIFEST,
        slots: SLOTS
      )

      module_function

      def theme
        Theme.new(
          key: "mercury_flight",
          name: "Mercury Flight",
          description: "A Mercury Flight-inspired campaign operations composition for ActiveAdmin 4.",
          active_admin_requirement: [">= 4.0.0.beta22", "< 5"],
          recipe_version: "1",
          skin: SKIN,
          composition: COMPOSITION
        )
      end
    end
  end
end
