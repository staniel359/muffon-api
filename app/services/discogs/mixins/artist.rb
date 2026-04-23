module Discogs
  module Mixins
    module Artist
      include Muffon::Utils::Artist

      private

      def name
        raw_artist_data['title']
      end

      def discogs_id
        raw_artist_data['id']
      end

      def source_original_link
        "https://www.discogs.com/artist/#{discogs_id}"
      end

      def image_data
        Discogs::Formatter::Image.call(
          image_url:
        )
      end
    end
  end
end
