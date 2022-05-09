module API
  module V2
    module YandexMusic
      class TracksController < API::V2::BaseController
        def info
          render_data_with_status
        end

        private

        def info_data
          ::YandexMusic::Track::Info.call(
            params.slice(
              *%i[track_id profile_id language]
            )
          )
        end
      end
    end
  end
end
