module Spotify
  module Track
    class Albums < Spotify::Track::Info
      private

      def track_data
        track_base_data
          .merge(track_albums_data)
      end

      def track_albums_data
        { albums: }
      end

      def albums
        [album_data].compact
      end

      def album_data
        return if album_id.blank?

        Spotify::Album::Info.call(
          album_id:,
          list: true,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )[:album]
      end

      def album_id
        track.dig(
          'album',
          'id'
        )
      end
    end
  end
end
