module API
  module YouTubeMusic
    class ArtistsController < API::BaseController
      def albums; end

      private

      def albums_data
        ::YouTubeMusic::Artist::Albums.call(
          params.slice(
            *%i[
              artist_id
              album_type
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
