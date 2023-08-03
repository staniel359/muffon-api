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

      def playlist_data
        {
          source: source_data,
          title:,
          description:,
          image: image_data,
          tracks_count:,
          tracks:
        }.compact
      end

      def tracks_count
        tracks_list.size
      end

      def tracks_list
        @tracks_list ||=
          raw_tracks_list.uniq do |t|
            t.dig(
              'track', 'id'
            )
          end
      end

      def raw_tracks_list
        playlist.dig(
          'tracks', 'items'
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
