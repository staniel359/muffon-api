module API
  module AmazonMusic
    class SearchController < API::BaseController
      def artists; end

      def albums; end

      def tracks; end

      private

      def artists_data
        ::AmazonMusic::Search::Artists.call(
          params.slice(
            *%i[
              query
              profile_id
              token
              page
            ]
          )
        )
      end

      def albums_data
        ::AmazonMusic::Search::Albums.call(
          params.slice(
            *%i[
              query
              profile_id
              token
              page
            ]
          )
        )
      end

      def tracks_data
        ::AmazonMusic::Search::Tracks.call(
          params.slice(
            *%i[
              query
              profile_id
              token
              page
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
