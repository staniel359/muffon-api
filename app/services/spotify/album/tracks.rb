module Spotify
  module Album
    class Tracks < Spotify::Album::Info
      PAGE_LIMIT = 50

      include Spotify::Utils::Pagination

      private

      def required_args
        super + %i[
          total_items_count
        ]
      end

      def data
        { tracks: }
      end

      def tracks
        total_pages_count
          .times
          .flat_map do |page|
            page_tracks(page + 1)
          end
      end

      def total_items_count
        @args[:total_items_count]
      end

      def page_tracks(page)
        Spotify::Album::Tracks::PageTracks.call(
          album_id: @args[:album_id],
          page:
        )
      end
    end
  end
end
