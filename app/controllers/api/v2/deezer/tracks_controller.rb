module API
  module V2
    module Deezer
      class TracksController < API::V2::BaseController
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
