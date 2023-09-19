module MusixMatch
  module Artist
    class Info < MusixMatch::Artist::Base
      include MusixMatch::Utils::Artist

      private

      def link
        "#{BASE_LINK}/artist.get"
      end

      def artist_data
        { name: }
      end

      def artist
        response_data.dig(
          'message', 'body', 'artist'
        )
      end
    end
  end
end
