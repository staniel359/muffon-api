module Genius
  module Artist
    class Info < Genius::Artist::Base
      include Genius::Mixins::Artist

      private

      def raw_artist_data
        response_data.dig(
          'response',
          'artist'
        )
      end
    end
  end
end
