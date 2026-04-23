module Odnoklassniki
  module Mixins
    module Artist
      private

      def name
        raw_artist_data['name']
      end

      def odnoklassniki_id
        raw_artist_data['id']
      end

      def source_original_link
        "https://ok.ru/music/artist/#{odnoklassniki_id}"
      end

      def image_data
        Odnoklassniki::Formatter::Image.call(
          image_url:
        )
      end

      def image_url
        raw_artist_data['image']
      end
    end
  end
end
