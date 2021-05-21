module Bandcamp
  module Utils
    module Album
      private

      def title
        album['title']
      end

      def bandcamp_id
        album['item_id']
      end

      def bandcamp_model
        album['item_type']
      end

      def artists
        [artist_data_formatted]
      end

      def artist_data_formatted
        {
          name: album['band_name'],
          bandcamp_id: album['band_id']
        }
      end

      def image_data
        image_data_formatted(
          image(album)
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
