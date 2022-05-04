module LastFM
  module Utils
    module Album
      include Muffon::Utils::Album

      private

      def title
        album['name']
      end

      def artist_name
        album['artist']
      end

      def image_data
        image_data_formatted(
          image
        )
      end

      def image
        album.dig(
          'image', -1, '#text'
        )
      end
    end
  end
end
