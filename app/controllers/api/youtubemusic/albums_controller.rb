module API
  module YouTubeMusic
    class AlbumsController < API::BaseController
      def info; end

      def description; end

      def links; end

      private

      def info_data
        ::YouTubeMusic::Album::Info.call(
          params.slice(
            *%i[
              album_id
              profile_id
              token
            ]
          )
        )
      end

      def description_data
        ::YouTubeMusic::Album::Description.call(
          params.slice(
            *%i[
              album_id
            ]
          )
        )
      end

      def links_data
        ::YouTubeMusic::Album::Links.call(
          params.slice(
            *%i[
              album_id
            ]
          )
        )
      end
    end
  end
end
