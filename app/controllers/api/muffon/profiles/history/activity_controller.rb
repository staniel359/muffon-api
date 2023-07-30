module API
  module Muffon
    module Profiles
      module History
        class ActivityController < API::Muffon::ProfilesController
          def info; end

          private

          def info_data
            ::Muffon::Profile::History::Activity.call(
              params.slice(
                *%i[profile_id token page limit order]
              )
            )
          end
        end
      end
    end
  end
end
