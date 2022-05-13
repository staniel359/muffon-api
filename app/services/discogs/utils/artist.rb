module Discogs
  module Utils
    module Artist
      include Muffon::Utils::Artist

      private

      def name
        artist['title']
      end

      def source_data
        {
          name: source_name,
          id: discogs_id
        }
      end

      def discogs_id
        artist['id']
      end

      def image_data
        image_data_formatted(
          image
        )
      end
    end
  end
end
