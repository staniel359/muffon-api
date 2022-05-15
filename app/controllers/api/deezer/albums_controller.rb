module API
  module Deezer
    class AlbumsController < API::BaseController
      def info
        render_data_with_status
      end

      private

      def info_data
        ::Deezer::Album::Info.call(
          params.slice(
            *%i[album_id profile_id language]
          )
        )
      end
    end
  end
end
