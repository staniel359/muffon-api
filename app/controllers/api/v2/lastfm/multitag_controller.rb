module API
  module V2
    module LastFM
      class MultitagController < API::V2::BaseController
        def artists
          render_data_with_status
        end

        private

        def artists_data
          ::LastFM::Multitag::Artists.call(
            params.slice(
              *%i[tags page limit profile_id]
            )
          )
        end
      end
    end
  end
end
