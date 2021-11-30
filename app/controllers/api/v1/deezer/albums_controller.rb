module API
  module V1
    module Deezer
      class AlbumsController < API::V1::BaseController
        def info
          render_data_with_status
        end

        private

        def info_data
          ::Deezer::Album::Info.call(
            params.slice(
              *%i[album_id profile_id]
            )
          )
        end
      end
    end
  end
end
