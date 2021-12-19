module Spotify
  module Utils
    module Album
      include Muffon::Utils::Album

      private

      def title
        album['name']
      end

      def spotify_id
        album['id']
      end

      def artists_list
        album['artists']
      end

      def image_data
        image_data_formatted(
          album, 'album'
        )
      end

      def release_date
        date_formatted(
          album['release_date']
        )
      end
    end
  end
end
