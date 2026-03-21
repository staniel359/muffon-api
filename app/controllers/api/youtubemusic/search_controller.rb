module API
  module YouTubeMusic
    class SearchController < API::BaseController
      def artists; end

      def albums; end

      def tracks; end

      def videos; end

      def mixes; end

      def playlists; end

      private

      def artists_data
        ::YouTubeMusic::Search::Artists.call(
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

      def tracks_data
        ::YouTubeMusic::Search::Tracks.call(
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
