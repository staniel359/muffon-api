module Spotify
  module Artist
    class Info < Spotify::Artist::Base
      private

      def name
        artist['name']
      end
    end
  end
end
