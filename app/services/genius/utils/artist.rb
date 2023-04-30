module Genius
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
          id: genius_id,
          links: source_links
        }
      end

      def genius_id
        artist['id']
      end

      def original_link
        artist['url']
      end
    end
  end
end
