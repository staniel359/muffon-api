module Discogs
  module Artist
    class Base < Discogs::Base
      BASE_LINK =
        'https://api.discogs.com/artists'.freeze

      private

      def primary_args
        [@args[:artist_id]]
      end

      def data
        { artist: artist_data }
      end

      def artist_data
        { name: }
      end

      def link
        self.class::BASE_LINK
      end
    end
  end
end
