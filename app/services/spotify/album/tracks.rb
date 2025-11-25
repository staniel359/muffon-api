module Spotify
  module Album
    class Tracks < Spotify::Album::Info
      PAGE_LIMIT = 50

      private

      def required_args
        super + %i[
          items_count
        ]
      end

      def data
        { tracks: }
      end

      def tracks
        pages_count
          .times
          .flat_map do |page|
            page_tracks(page + 1)
          end
      end

      def pages_count
        items_count
          .fdiv(PAGE_LIMIT)
          .ceil
      end

      def items_count
        @args[:items_count]
      end

      def page_tracks(page)
        Spotify::Album::Tracks::PageTracks.call(
          album_id: @args[:album_id],
          page:,
          limit: PAGE_LIMIT
        )
      end
    end
  end
end
