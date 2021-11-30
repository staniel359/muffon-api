module API
  module V1
    module Odnoklassniki
      class AlbumsController < API::V1::BaseController
        def info
          render_data_with_status
        end

        def tags
          render_data_with_status
        end

        private

        def info_data
          ::Odnoklassniki::Album::Info.call(
            params.slice(
              *%i[album_id profile_id]
            )
          )
        end

        def tags_data
          ::Odnoklassniki::Album::Tags.call(
            params.slice(:album_id)
          )
        end
      end
    end
  end
end
