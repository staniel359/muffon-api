module API
  module MusixMatch
    class SearchController < API::BaseController
      def artists; end

      def tracks; end

      private

      def artists_data
        ::MusixMatch::Search::Artists.call(
          params.slice(
            *%i[query profile_id token page limit]
          )
        )
      end

      def tracks_data
        ::MusixMatch::Search::Tracks.call(
          params.slice(
            *%i[query profile_id token page limit]
          )
        )
      end
    end
  end
end
