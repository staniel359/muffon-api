module Spotify
  module Playlist
    class Tracks < Spotify::Playlist::Info
      PAGE_LIMIT = 50

      private

      def required_args
        super + %i[
          items_count
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
        Spotify::Playlist::Tracks::PageTracks.call(
          playlist_id: @args[:playlist_id],
          page:,
          limit: PAGE_LIMIT,
          profile_id: @args[:profile_id]
        )
      end
    end
  end
end
