# lib/active_admin/themes/theme.rb
# frozen_string_literal: true

module ActiveAdmin
  module Themes
    # A theme binds one skin and one composition to a compatible ActiveAdmin recipe.
    Theme = Data.define(
      :key, :name, :description, :active_admin_requirement, :recipe_version, :skin, :composition
    ) do
      # The public value object keeps its complete, named metadata contract explicit.
      # rubocop:disable-next Metrics/ParameterLists
      def initialize(key:, name:, description:, active_admin_requirement:, recipe_version:, skin:, composition:)
        super(
          key: key.to_sym,
          name: String(name).freeze,
          description: String(description).freeze,
          active_admin_requirement: Gem::Requirement.create(active_admin_requirement).freeze,
          recipe_version: String(recipe_version).freeze,
          skin: skin,
          composition: composition
        )
      end

      def supports?(version)
        active_admin_requirement.satisfied_by?(Gem::Version.new(version))
      end

      def source
        [skin.source, composition.source].reject(&:empty?).join("\n")
      end
    end
  end
end
