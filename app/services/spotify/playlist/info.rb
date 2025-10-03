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
            total_items_count: tracks_count
          )[:tracks]
      end

      def tracks_count
        playlist.dig(
          'tracks',
          'total'
        )
      end

      def track_data_formatted(track)
        Spotify::Playlist::Tracks::Track.call(
          track:
        )
      end
    end
  end
end
