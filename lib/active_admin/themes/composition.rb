# lib/active_admin/themes/composition.rb
# frozen_string_literal: true

module ActiveAdmin
  module Themes
    # A composition owns presentation structure and its host-applied CSS hooks.
    Composition = Data.define(:key, :name, :description, :manifest, :slots) do
      def initialize(key:, name:, description:, manifest:, slots:)
        normalized_slots = slots.to_h do |slot, css_class|
          [slot.to_sym, String(css_class).dup.freeze]
        end.freeze

        super(
          key: key.to_sym,
          name: String(name).freeze,
          description: String(description).freeze,
          manifest: manifest,
          slots: normalized_slots
        )
      end

      def source
        manifest.source
      end

      def class_for(slot)
        slots.fetch(slot.to_sym)
      end
    end
  end
end
