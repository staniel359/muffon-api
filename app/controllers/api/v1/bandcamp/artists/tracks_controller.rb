module API
  module V1
    module Bandcamp
      module Artists
        class TracksController < API::V1::BaseController
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
            ::Bandcamp::Track::Info.call(
              params.slice(
                *%i[artist_id track_id profile_id]
              )
            )
          end

          def description_data
            ::Bandcamp::Track::Description.call(
              params.slice(
                *%i[artist_id track_id]
              )
            )
          end

          def tags_data
            ::Bandcamp::Track::Tags.call(
              params.slice(
                *%i[artist_id track_id]
              )
            )
          end
        end
      end
    end
  end
end
