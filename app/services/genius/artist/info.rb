module Genius
  module Artist
    class Info < Genius::Artist::Base
      include Genius::Utils::Artist

      private

      def primary_args
        [@args[:artist_id]]
      end

      def no_data?
        artist.blank?
      end

      def artist
        response_data.dig(
          'response', 'artist'
        )
      end
    end
  end
end
