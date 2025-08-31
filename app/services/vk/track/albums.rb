module VK
  module Track
    class Albums < VK::Track::Info
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

        VK::Album::Info.call(
          album_id:,
          owner_id:,
          access_key:,
          list: true,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )[:album]
      end

      def album_id
        album['id']
      end

      def owner_id
        album['owner_id']
      end

      def access_key
        album['access_key']
      end
    end
  end
end
