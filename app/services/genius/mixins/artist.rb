module Genius
  module Mixins
    module Artist
      private

      def name
        raw_artist_data['name']
      end

      def genius_id
        raw_artist_data['id']
      end

      def source_original_link
        raw_artist_data['url']
      end

      def image_data
        Genius::Formatter::Image.call(
          image_url:
        )
      end

      def image_url
        raw_artist_data['image_url']
      end
    end
  end
end
