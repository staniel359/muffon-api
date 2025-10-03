module MusixMatch
  module Utils
    module Artist
      include Muffon::Utils::Artist

      private

      def name
        artist['artist_name']
      end

      def source_data
        {
          name: source_name,
          id: musixmatch_id,
          links: source_links_data
        }
      end

      def musixmatch_id
        artist['artist_id']
      end

      def original_link
        "https://www.musixmatch.com/artist/#{musixmatch_id}"
      end
    end
  end
end
