module API
  module Genius
    class SearchController < API::BaseController
      def artists; end

      def albums; end

      def tracks; end

      private

      def artists_data
        ::Genius::Search::Artists.call(
          params.slice(
            *%i[query profile_id page limit]
          )
        )
      end

      def albums_data
        ::Genius::Search::Albums.call(
          params.slice(
            *%i[query profile_id page limit]
          )
        )
      end

      def tracks_data
        ::Genius::Search::Tracks.call(
          params.slice(
            *%i[query profile_id page limit]
          )
        )
      end
    end
  end
end
