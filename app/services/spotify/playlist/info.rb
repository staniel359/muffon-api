module Spotify
  module Playlist
    class Info < Spotify::Playlist::Base
      include Spotify::Mixins::Playlist

      private

      def playlist_data
        Muffon::Formatter::User::Playlist::Info.call(
          source_original_link:,
          source_name:,
          source_playlist_id: spotify_id,
          title:,
          description:,
          image_data:,
          tracks_count: raw_tracks.size,
          tracks:
        )
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
