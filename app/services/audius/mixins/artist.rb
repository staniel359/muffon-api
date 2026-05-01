module Audius
  module Mixins
    module Artist
      def name
        raw_artist_data['name']
      end

      def audius_id
        raw_artist_data['id']
      end

      def source_original_link
        "https://audius.co/#{audius_slug}"
      end

      def audius_slug
        raw_artist_data['handle']
      end

      def image_data
        Audius::Formatter::Image.call(
          images_data:
        )
      end

      def images_data
        raw_artist_data['profile_picture']&.except('mirrors')
      end
    end
  end
end
