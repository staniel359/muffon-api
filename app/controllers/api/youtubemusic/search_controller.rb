module API
  module YouTubeMusic
    class SearchController < API::BaseController
      def tracks; end

      def videos; end

      private

      def tracks_data
        ::YouTubeMusic::Search::Tracks.call(
          params.slice(
            *%i[query profile_id token page]
          )
        )
      end

      def videos_data
        ::YouTubeMusic::Search::Videos.call(
          params.slice(
            *%i[query profile_id token page]
          )
        )
      end
    end
  end
end
