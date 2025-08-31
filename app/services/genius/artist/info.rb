module Genius
  module Artist
    class Info < Genius::Artist::Base
      private

      def name
        artist['name']
      end

      def artist
        response_data.dig(
          'response',
          'artist'
        )
      end
    end
  end
end
