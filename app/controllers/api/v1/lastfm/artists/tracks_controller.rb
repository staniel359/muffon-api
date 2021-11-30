module API
  module V1
    module LastFM
      module Artists
        class TracksController < ArtistsController
          def info
            render_data_with_status
          end

          def description
            render_data_with_status
          end

          def tags
            render_data_with_status
          end

          def similar
            render_data_with_status
          end

          private

          def info_data
            ::LastFM::Track::Info.call(
              params.slice(
                *%i[artist track profile_id]
              )
            )
          end

          def description_data
            ::LastFM::Track::Description.call(
              params.slice(
                *%i[artist track]
              )
            )
          end

          def tags_data
            ::LastFM::Track::Tags.call(
              params.slice(
                *%i[artist track]
              )
            )
          end

          def similar_data
            ::LastFM::Track::Similar.call(
              params.slice(
                *%i[artist track profile_id page limit]
              )
            )
          end
        end
      end
    end
  end
end
