module API
  module Bandcamp
    class SearchController < API::BaseController
      def artists; end

      def albums; end

      def tracks; end

      private

      def artists_data
        ::Bandcamp::Search::Artists.call(
          params.slice(
            *%i[query profile_id page limit]
          )
        )
      end

      def albums_data
        ::Bandcamp::Search::Albums.call(
          params.slice(
            *%i[query profile_id page limit]
          )
        )
      end

      def tracks_data
        ::Bandcamp::Search::Tracks.call(
          params.slice(
            *%i[query profile_id page limit]
          )
        )
      end
    end
  end
end
