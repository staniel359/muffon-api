module API
  module Muffon
    module Profiles
      class OnlineController < API::Muffon::ProfilesController
        def update; end

        private

        def update_data
          ::Muffon::Processor::Profile::Online::Updater.call(
            params.slice(
              *%i[profile_id token online]
            )
          )
        end
      end
    end
  end
end
