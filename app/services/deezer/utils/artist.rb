module Deezer
  module Utils
    module Artist
      include Muffon::Utils::Artist

      private

      def name
        artist['ART_NAME']
      end

      def source_data
        {
          name: source_name,
          id: deezer_id,
          links: source_links
        }
      end

      def deezer_id
        artist['ART_ID'].to_i
      end

      def original_link
        "https://www.deezer.com/artist/#{deezer_id}"
      end
    end
  end
end
