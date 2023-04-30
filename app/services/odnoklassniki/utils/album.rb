module Odnoklassniki
  module Utils
    module Album
      include Muffon::Utils::Album

      private

      def title
        album['name']
      end

      def artists_list
        album['allArtists']
      end

      def source_data
        {
          name: source_name,
          id: odnoklassniki_id,
          links: source_links
        }
      end

      def odnoklassniki_id
        album['id']
      end

      def original_link
        "https://ok.ru/music/album/#{odnoklassniki_id}"
      end

      def image_data
        image_data_formatted(
          album['image']
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
