module API
  module YouTube
    class SearchController < API::BaseController
      def videos; end

      def channels; end

      def playlists; end

      private

      def videos_data
        ::YouTube::Search::Videos.call(
          params.slice(
            *%i[query profile_id token page limit]
          )
        )
      end

      def channels_data
        ::YouTube::Search::Channels.call(
          params.slice(
            *%i[query profile_id token page limit]
          )
        )
      end

      def playlists_data
        ::YouTube::Search::Playlists.call(
          params.slice(
            *%i[query profile_id token page limit]
          )
        )
      end
    end
  end
end
