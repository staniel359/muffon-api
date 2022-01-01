module Spotify
  module Artist
    class Base < Spotify::Base
      private

      def link
        "#{BASE_LINK}/artists/#{@args[:artist_id]}"
      end

      def data
        { artist: artist_data }
      end

      def artist_data
        { name: }
      end
    end
  end
end
