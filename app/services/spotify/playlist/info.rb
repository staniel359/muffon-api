module Spotify
  module Playlist
    class Info < Spotify::Playlist::Base
      include Spotify::Utils::Playlist

      private

      def playlist_data
        {
          source: source_data,
          title:,
          description:,
          image: image_data,
          tracks_count: raw_tracks.size,
          tracks:
        }.compact
      end

      def raw_tracks
        @raw_tracks ||=
          Spotify::Playlist::Tracks.call(
            playlist_id: @args[:playlist_id],
            items_count: tracks_count,
            profile_id: @args[:profile_id]
          )[:tracks]
      end

      def tracks_count
        raw_playlist_data.dig(
          'content',
          'totalCount'
        )
      end

      def track_data_formatted(
        raw_track_data
      )
        Spotify::Playlist::Tracks::Track.call(
          raw_track_data:
        )
      end
    end
  end
end
