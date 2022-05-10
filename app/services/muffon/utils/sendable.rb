module Muffon
  module Utils
    module Sendable
      private

      def content_arg
        [
          @args[:content],
          @args[:artists],
          @args[:albums],
          @args[:tracks],
          @args[:images]
        ].find(&:present?)
      end

      def sendable_params
        {
          content:,
          artists:,
          albums:,
          tracks:
        }
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

      def artists
        params_artists +
          content_artists
      end

      def params_artists
        @args[:artists] || []
      end

      def content_artists
        models.select do |m|
          m['model'] == 'artist'
        end
      end

      def albums
        params_albums +
          content_albums
      end

      def params_albums
        @args[:albums] || []
      end

      def content_albums
        models.select do |m|
          m['model'] == 'album'
        end
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
        @models ||=
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
