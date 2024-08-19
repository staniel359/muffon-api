module Spotify
  module Playlist
    class Info < Spotify::Base
      include Spotify::Utils::Playlist

      private

      def primary_args
        [@args[:playlist_id]]
      end

      def link
        "#{BASE_LINK}/playlists/#{@args[:playlist_id]}"
      end

      def data
        { playlist: playlist_data }
      end

      def spotify_token
        spotify_connection&.access_token || super
      end

      def playlist_data
        {
          source: source_data,
          title:,
          description:,
          image: image_data,
          tracks_count:
            tracks_list.size,
          tracks:
        }.compact
      end

      def tracks_list
        @tracks_list ||=
          Spotify::Playlist::Info::Tracks.call(
            playlist_id:
              @args[:playlist_id],
            profile_id:
              @args[:profile_id],
            total_items_count: tracks_count
          )[:tracks]
      end

      def tracks_count
        playlist.dig(
          'tracks', 'total'
        )
      end

      def track_data_formatted(track)
        Spotify::Playlist::Info::Track.call(
          track:
        )
      end

      alias playlist response_data
    end
  end
end
