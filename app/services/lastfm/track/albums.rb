module LastFM
  module Track
    class Albums < LastFM::Track::Info
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
        return if album.blank?

        LastFM::Album::Info.call(
          artist_name: album_artist_name,
          album_title:,
          list: true,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )[:album]
      end

      def album
        track['album']
      end

      def album_artist_name
        album['artist']
      end

      def album_title
        album['title']
      end
    end
  end
end
