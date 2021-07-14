module Genius
  module Artist
    class Info < Genius::Artist::Base
      private

      def primary_args
        [@args.artist_id]
      end

      def no_data?
        artist.blank?
      end

      def artist
        @artist ||= response_data.dig(
          'response', 'artist'
        )
      end

      def name
        artist['name']
      end
    end
  end
end
