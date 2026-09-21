# lib/active_admin/themes/skin.rb
# frozen_string_literal: true

module ActiveAdmin
  module Themes
    # A skin owns semantic color and visual-token choices, not page composition.
    Skin = Data.define(:key, :name, :description, :manifest) do
      def initialize(key:, name:, description:, manifest:)
        super(
          key: key.to_sym,
          name: String(name).freeze,
          description: String(description).freeze,
          manifest: manifest
        )
      end

      def source
        manifest.source
      end
    end
  end
end
