module Genius
  module Artist
    class Base < Genius::Base
      private

      def primary_args
        [@args[:artist_id]]
      end

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
