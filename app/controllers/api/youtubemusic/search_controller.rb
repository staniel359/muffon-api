module API
  module YouTubeMusic
    class SearchController < API::BaseController
      def tracks; end

      def albums; end

      def videos; end

      def mixes; end

      def playlists; end

      private

      def tracks_data
        ::YouTubeMusic::Search::Tracks.call(
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
        ::YouTubeMusic::Search::Albums.call(
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

      def videos_data
        ::YouTubeMusic::Search::Videos.call(
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

      def mixes_data
        ::YouTubeMusic::Search::Mixes.call(
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

      def playlists_data
        ::YouTubeMusic::Search::Playlists.call(
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
    end
  end
end
