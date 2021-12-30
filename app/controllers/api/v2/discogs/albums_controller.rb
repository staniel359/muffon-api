module API
  module V2
    module Discogs
      class AlbumsController < API::V2::BaseController
        def info
          render_data_with_status
        end

        def description
          render_data_with_status
        end

        def tags
          render_data_with_status
        end

        private

        def info_data
          ::Discogs::Album::Info.call(
            params.slice(
              *%i[album_id profile_id]
            )
          )
        end

        def description_data
          ::Discogs::Album::Description.call(
            params.slice(:album_id)
          )
        end

        def tags_data
          ::Discogs::Album::Tags.call(
            params.slice(:album_id)
          )
        end
      end
    end
  end
end
