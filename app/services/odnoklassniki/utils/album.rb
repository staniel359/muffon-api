module Odnoklassniki
  module Utils
    module Album
      include Muffon::Utils::Album

      private

      def title
        album['name']
      end

      def artist_name
        artist_names
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
