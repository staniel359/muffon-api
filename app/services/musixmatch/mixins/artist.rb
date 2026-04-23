module MusixMatch
  module Mixins
    module Artist
      private

      def name
        raw_artist_data['name']
      end

      def musixmatch_slug
        raw_artist_data['artist_vanity_id']
      end

      def source_original_link
        "https://www.musixmatch.com/artist/#{musixmatch_slug}"
      end

      def image_data
        MusixMatch::Formatter::Image.call(
          image_url:
        )
      end
    end
  end
end
