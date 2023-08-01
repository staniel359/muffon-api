module API
  module Muffon
    module Profiles
      module History
        class PlayerController < API::Muffon::ProfilesController
          def info; end

          def update; end

          private

          def info_data
            ::Muffon::Profile::History::Player.call(
              params.slice(
                *%i[profile_id token page limit order]
              )
            )
          end

          def update_data
            ::Muffon::Processor::Profile::History::Player::Updater.call(
              params.slice(
                *%i[profile_id token playing]
              )
            )
          end

          def destroy_data
            ::Muffon::Processor::Profile::History::Player::Destroyer.call(
              params.slice(
                *%i[profile_id token]
              )
            )
          end
        end
      end
    end
  end
end
