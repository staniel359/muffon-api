module MusixMatch
  module Utils
    module Artist
      include Muffon::Utils::Artist

      private

      def name
        raw_artist_data['name']
      end

      def source_data
        {
          name: source_name,
          slug: musixmatch_slug,
          links: source_links_data
        }
      end

      def original_link
        "https://www.musixmatch.com/artist/#{musixmatch_slug}"
      end

      def image_data
        image_data_formatted(
          raw_image
        )
      end
    end
  end
end
