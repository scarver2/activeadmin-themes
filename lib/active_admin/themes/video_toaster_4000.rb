# lib/active_admin/themes/video_toaster_4000.rb
# frozen_string_literal: true

require "active_admin/themes/composition"
require "active_admin/themes/recipes/video_toaster_4000"
require "active_admin/themes/skin"
require "active_admin/themes/theme"

module ActiveAdmin
  module Themes
    module VideoToaster4000
      SLOTS = {
        actions: "video-toaster-4000-actions",
        data_region: "video-toaster-4000-data-region",
        data_table: "video-toaster-4000-data-table",
        footer: "video-toaster-4000-footer",
        form: "video-toaster-4000-form",
        help: "video-toaster-4000-help",
        launcher: "video-toaster-4000-launcher",
        launcher_art: "video-toaster-4000-launcher-art",
        launcher_group: "video-toaster-4000-launcher-group",
        navigation: "video-toaster-4000-navigation",
        primary_action: "video-toaster-4000-primary-action",
        primary_window: "video-toaster-4000-primary-window",
        screen_header: "video-toaster-4000-screen-header",
        secondary_action: "video-toaster-4000-secondary-action",
        side_window: "video-toaster-4000-side-window",
        status: "video-toaster-4000-status",
        status_tag: "video-toaster-4000-status-tag",
        wide_window: "video-toaster-4000-wide-window",
        window: "video-toaster-4000-window",
        window_actions: "video-toaster-4000-window-actions",
        window_content: "video-toaster-4000-window-content",
        window_header: "video-toaster-4000-window-header",
        workspace: "video-toaster-4000-workspace",
        workspace_grid: "video-toaster-4000-workspace-grid"
      }.freeze
      SKIN = Skin.new(
        key: "video_toaster_4000",
        name: "Video Toaster 4000",
        description: "A dark neutral broadcast-workstation palette with compact channel and status cues.",
        manifest: Recipes::VideoToaster4000::SKIN_MANIFEST
      )
      COMPOSITION = Composition.new(
        key: "video_toaster_4000",
        name: "Video Toaster 4000 Production Workspace",
        description: "Dense labeled control bays, recessed data wells, status channels, and production surfaces.",
        manifest: Recipes::VideoToaster4000::COMPOSITION_MANIFEST,
        slots: SLOTS
      )

      module_function

      def theme
        Theme.new(
          key: "video_toaster_4000",
          name: "Video Toaster 4000",
          description: "A Video Toaster 4000 and period LightWave-inspired production composition for ActiveAdmin 4.",
          active_admin_requirement: [">= 4.0.0.beta22", "< 5"],
          recipe_version: "1",
          skin: SKIN,
          composition: COMPOSITION
        )
      end
    end
  end
end
