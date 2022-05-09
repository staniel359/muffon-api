module Muffon
  module Utils
    module Sendable
      private

      def content_arg
        @args[:content].presence ||
          @args[:tracks].presence ||
          @args[:images].presence
      end

      def content
        return if @args[:content].blank?

        @args[:content].gsub(
          link_regex, ''
        ).strip
      end

      def link_regex
        %r{\[link\](.+?)\[/link\]}
      end

      def tracks
        params_tracks +
          content_tracks
      end

      def params_tracks
        @args[:tracks] || []
      end

      def content_tracks
        models.select do |m|
          m['model'] == 'track'
        end
      end

      def models
        links.map do |l|
          JSON.parse(l)
        end
      end

      def links
        return [] if @args[:content].blank?

        @args[:content].scan(
          link_regex
        ).flatten
      end
    end
  end
end
