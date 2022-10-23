module API
  module Muffon
    module Profiles
      class PlayingController < API::Muffon::ProfilesController
        def update; end

        private

        def update_data
          ::Muffon::Processor::Profile::Playing::Updater.call(
            params.slice(
              *%i[profile_id token playing]
            )
          )
        end
      end
    end
  end
end
