# lib/active_admin/themes/stylesheet_manifest.rb
# frozen_string_literal: true

require "pathname"

module ActiveAdmin
  module Themes
    # Deterministically composes an explicit, ordered list of packaged CSS parts.
    class StylesheetManifest
      attr_reader :parts

      def initialize(root:, parts:)
        @root = Pathname.new(root).expand_path.freeze
        @parts = parts.map { |part| normalize(part) }.freeze
        raise ArgumentError, "stylesheet parts must be unique" unless @parts.uniq.length == @parts.length
      end

      def source
        parts.filter_map do |part|
          content = root.join("#{part}.css").binread
          content unless content.empty?
        end.join("\n")
      end

      private

      attr_reader :root

      def normalize(part)
        value = String(part).dup.freeze
        if value.empty? || value.match?(/[\\:\x00]/)
          raise ArgumentError, "stylesheet parts must be normalized relative paths"
        end

        segments = value.split("/", -1)
        invalid_path = Pathname.new(value).absolute?
        invalid_path ||= segments.intersect?(["", ".", ".."])
        raise ArgumentError, "stylesheet parts must be normalized relative paths" if invalid_path

        value
      end
    end
  end
end
