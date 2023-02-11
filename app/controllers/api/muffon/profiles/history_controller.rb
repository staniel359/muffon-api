module API
  module Muffon
    module Profiles
      class HistoryController < API::Muffon::ProfilesController
        def events; end

        private

        def events_data
          ::Muffon::Profile::History::Events.call(
            params.slice(
              *%i[profile_id token page limit order]
            )
          )
        end
      end
    end
  end
end
