module API
  module Odnoklassniki
    class SearchController < API::BaseController
      def artists; end

      def albums; end

      def tracks; end

      private

      def artists_data
        ::Odnoklassniki::Search::Artists.call(
          params.slice(
            *%i[query profile_id page limit]
          )
        )
      end

      def albums_data
        ::Odnoklassniki::Search::Albums.call(
          params.slice(
            *%i[query profile_id page limit]
          )
        )
      end

      def tracks_data
        ::Odnoklassniki::Search::Tracks.call(
          params.slice(
            *%i[query profile_id page limit]
          )
        )
      end
    end
  end
end
