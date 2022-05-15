module API
  module Spotify
    class AlbumsController < API::BaseController
      def info
        render_data_with_status
      end

      private

      def info_data
        ::Spotify::Album::Info.call(
          params.slice(
            *%i[album_id profile_id]
          )
        )
      end
    end
  end
end
