module API
  module Spotify
    class SearchController < API::BaseController
      def artists; end

      def albums; end

      def tracks; end

      private

      def artists_data
        ::Spotify::Search::Artists.call(
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
        ::Spotify::Search::Albums.call(
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
        ::Spotify::Search::Tracks.call(
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
    end
  end
end
