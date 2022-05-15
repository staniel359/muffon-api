module API
  module Muffon
    module Profiles
      class LibraryController < API::Muffon::ProfilesController
        def info
          render_data_with_status
        end

        private

        def info_data
          ::Muffon::Profile::Library::Info.call(
            params.slice(:profile_id)
          )
        end
      end
    end
  end
end
