module Spotify
  module Track
    class Albums < Spotify::Track::Info
      private

      def track_data
        {
          **track_base_data,
          albums:
        }.compact
      end

      def raw_albums
        [raw_album_data].compact
      end

      def raw_album_data
        raw_track_data['albumOfTrack']
      end

      def album_data_formatted(
        raw_album_data
      )
        Spotify::Track::Albums::Album.call(
          raw_album_data:,
          raw_artists: raw_primary_artists,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
