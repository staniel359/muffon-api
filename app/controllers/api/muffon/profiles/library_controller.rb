module API
  module Muffon
    module Profiles
      class LibraryController < API::Muffon::ProfilesController
        def info; end

        def destroy; end

        private

        def info_data
          ::Muffon::Profile::Library::Info.call(
            params.slice(
              *%i[profile_id token other_profile_id]
            )
          )
        end

        def destroy_data
          ::Muffon::Processor::Profile::Library::Destroyer.call(
            params.slice(
              *%i[profile_id token password]
            )
          )
        end
      end
    end
  end
end
