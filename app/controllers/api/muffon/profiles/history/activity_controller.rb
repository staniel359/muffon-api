module API
  module Muffon
    module Profiles
      module History
        class ActivityController < API::Muffon::ProfilesController
          def info; end

          def destroy; end

          private

          def info_data
            ::Muffon::Profile::History::Activity.call(
              params.slice(
                *%i[profile_id token page limit order]
              )
            )
          end

          def destroy_data
            ::Muffon::Processor::Profile::History::Activity::Destroyer.call(
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
