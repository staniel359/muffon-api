module Discogs
  module Utils
    module Artist
      MODEL_NAME = 'artist'.freeze

      include Muffon::Utils::Artist

      private

      def name
        artist['title']
      end

      def source_data
        {
          name: source_name,
          id: discogs_id,
          links: source_links_data
        }
      end

      def discogs_id
        artist['id']
      end

      def original_link
        'https://www.discogs.com' \
          "/#{model_name}/#{discogs_id}"
      end

      def image_data
        image_data_formatted(
          image
        ) || super
      end
    end
  end
end
