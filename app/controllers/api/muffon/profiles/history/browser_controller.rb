module API
  module Muffon
    module Profiles
      module History
        class BrowserController < API::Muffon::ProfilesController
          def info; end

          def update; end

          private

          def info_data
            ::Muffon::Profile::History::Browser.call(
              params.slice(
                *%i[profile_id token page limit order]
              )
            )
          end

          def update_data
            ::Muffon::Processor::Profile::History::Browser::Updater.call(
              params.slice(
                *%i[profile_id token route]
              )
            )
          end
        end
      end
    end
  end
end
