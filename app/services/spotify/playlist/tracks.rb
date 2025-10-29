module Spotify
  module Playlist
    class Tracks < Spotify::Playlist::Info
      PAGE_LIMIT = 50

      include Spotify::Utils::Pagination

      private

      def required_args
        super + %i[
          total_items_count
        ]
      end

      def data
        {
          tracks:
            tracks_filtered_distinct
        }
      end

      def tracks_filtered_distinct
        tracks_filtered.uniq do |track_data|
          track_data.dig(
            'track',
            'id'
          )
        end
      end

      def tracks_filtered
        tracks.select do |track_data|
          track_data
            .dig(
              'track',
              'name'
            )
            .present?
        end
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
        Spotify::Playlist::Tracks::PageTracks.call(
          playlist_id: @args[:playlist_id],
          page:
        )
      end
    end
  end
end
