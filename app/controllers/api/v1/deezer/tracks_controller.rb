module API
  module V1
    module Deezer
      class TracksController < API::V1::BaseController
        def info
          render_data_with_status
        end

        private

        def info_data
          ::Deezer::Track::Info.call(
            params.slice(
              *%i[track_id profile_id]
            )
          )
        end
      end
    end
  end
end
