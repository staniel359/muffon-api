module API
  module Spotify
    class AlbumsController < API::BaseController
      def info; end

      def links; end

      private

      def info_data
        ::Spotify::Album::Info.call(
          params.slice(
            *%i[
              album_id
              profile_id
              token
            ]
          )
        )
      end

      def links_data
        ::Spotify::Album::Links.call(
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
