module Deezer
  module Artist
    class Base < Deezer::Base
      private

      def data
        { artist: artist_data }
      end

      def artist_data
        { name: }
      end
    end
  end
end
