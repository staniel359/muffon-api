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
            *%i[
              query
              profile_id
              token
              page
              limit
            ]
          )
        )
      end

      def albums_data
        ::Odnoklassniki::Search::Albums.call(
          params.slice(
            *%i[
              query
              profile_id
              token
              page
              limit
            ]
          )
        )
      end

      def tracks_data
        ::Odnoklassniki::Search::Tracks.call(
          params.slice(
            *%i[
              query
              profile_id
              token
              page
              limit
              with_automatch
              artist_name
              track_title
            ]
          )
        )
      end
    end
  end
end
