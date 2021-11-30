module API
  module V1
    module Genius
      class AlbumsController < API::V1::BaseController
        def info
          render_data_with_status
        end

        def description
          render_data_with_status
        end

        private

        def info_data
          ::Genius::Album::Info.call(
            params.slice(
              *%i[album_id profile_id]
            )
          )
        end

        def description_data
          ::Genius::Album::Description.call(
            params.slice(:album_id)
          )
        end
      end
    end
  end
end
