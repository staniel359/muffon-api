module API
  module Deezer
    class SearchController < API::BaseController
      def artists; end

      def albums; end

      def tracks; end

      private

      def artists_data
        ::Deezer::Search::Artists.call(
          params.slice(
            *%i[query profile_id token page limit]
          )
        )
      end

      def albums_data
        ::Deezer::Search::Albums.call(
          params.slice(
            *%i[query profile_id token page limit]
          )
        )
      end

      def tracks_data
        ::Deezer::Search::Tracks.call(
          params.slice(
            *%i[query profile_id token page limit]
          )
        )
      end
    end
  end
end
