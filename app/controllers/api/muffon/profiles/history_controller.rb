module API
  module Muffon
    module Profiles
      class HistoryController < API::Muffon::ProfilesController
        def activity; end

        def player; end

        private

        def activity_data
          ::Muffon::Profile::History::Activity.call(
            params.slice(
              *%i[profile_id token page limit order]
            )
          )
        end

        def player_data
          ::Muffon::Profile::History::Player.call(
            params.slice(
              *%i[profile_id token page limit order]
            )
          )
        end
      end
    end
  end
end
