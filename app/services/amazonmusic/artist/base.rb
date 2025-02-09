module AmazonMusic
  module Artist
    class Base < AmazonMusic::Base
      private

      def primary_args
        [@args[:artist_id]]
      end

      def artist_id
        @args[:artist_id]
      end

      def data
        { artist: artist_data }
      end

      def artist_data
        { name: }
      end

      alias response post_response
    end
  end
end
