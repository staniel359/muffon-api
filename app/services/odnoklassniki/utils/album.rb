module Odnoklassniki
  module Utils
    module Album
      private

      def title
        album['name']
      end

      def odnoklassniki_id
        album['id']
      end

      def artists_list
        album['allArtists']
      end

      def image_data
        image_data_formatted(
          album['image'], 'album'
        )
      end

      def release_date
        date_formatted(
          album['year'].to_s
        )
      end
    end
  end
end
