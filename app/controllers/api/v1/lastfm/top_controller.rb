module API
  module V1
    module LastFM
      class TopController < API::V1::BaseController
        def artists
          render_data_with_status
        end

        def tracks
          render_data_with_status
        end

        def tags
          render_data_with_status
        end

        private

        def artists_data
          ::LastFM::Top::Artists.call(
            params.slice(
              *%i[profile_id page limit]
            )
          )
        end

        def tracks_data
          ::LastFM::Top::Tracks.call(
            params.slice(
              *%i[profile_id page limit]
            )
          )
        end

        def tags_data
          ::LastFM::Top::Tags.call(
            params.slice(
              *%i[profile_id page limit]
            )
          )
        end
      end
    end
  end
end
