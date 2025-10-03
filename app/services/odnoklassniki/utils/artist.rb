module Odnoklassniki
  module Utils
    module Artist
      include Muffon::Utils::Artist

      private

      def name
        artist['name']
      end

      def source_data
        {
          name: source_name,
          id: odnoklassniki_id,
          links: source_links_data
        }
      end

      def odnoklassniki_id
        artist['id']
      end

      def original_link
        "https://ok.ru/music/artist/#{odnoklassniki_id}"
      end
    end
  end
end
