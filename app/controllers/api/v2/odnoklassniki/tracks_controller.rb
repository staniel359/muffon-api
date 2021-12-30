module API
  module V2
    module Odnoklassniki
      class TracksController < API::V2::BaseController
        def info
          render_data_with_status
        end

        private

        def info_data
          ::Odnoklassniki::Track::Info.call(
            params.slice(
              *%i[track_id profile_id]
            )
          )
        end
      end
    end
  end
end
