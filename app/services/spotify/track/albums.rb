module Spotify
  module Track
    class Albums < Spotify::Track::Info
      private

      def track_data
        Muffon::Formatter::Track::Albums.call(
          source_original_link:,
          source_name:,
          source_track_id: spotify_id,
          title:,
          artists:,
          albums:
        )
      end

      def albums
        [album_data].compact
      end

      def album_data
        return if raw_album_data.blank?

        Spotify::Album::Info.call(
          album_id: album_spotify_id,
          is_list: true,
          **self_args
        )[:album]
      end

      def album_spotify_id
        raw_album_data['id']
      end

      def raw_album_data
        raw_track_data['albumOfTrack']
      end
    end
  end
end
