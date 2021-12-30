module API
  module V2
    module Bandcamp
      module Artists
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
            ::Bandcamp::Album::Info.call(
              params.slice(
                *%i[artist_id album_id album_type profile_id]
              )
            )
          end

          def description_data
            ::Bandcamp::Album::Description.call(
              params.slice(
                *%i[artist_id album_id album_type]
              )
            )
          end

          def tags_data
            ::Bandcamp::Album::Tags.call(
              params.slice(
                *%i[artist_id album_id album_type]
              )
            )
          end
        end
      end
    end
  end
end
