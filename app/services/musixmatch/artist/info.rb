module MusixMatch
  module Artist
    class Info < MusixMatch::Artist::Base
      private

      def name
        artist['artist_name']
      end

      def artist
        response_data.dig(
          'message',
          'body',
          'artist'
        )
      end

      def link
        "#{BASE_LINK}/artist.get"
      end
    end
  end
end
