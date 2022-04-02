module API
  module V2
    module Muffon
      module Profiles
        class FavoritesController < API::V2::Muffon::ProfilesController
          def info
            render_data_with_status
          end

          private

          def info_data
            ::Muffon::Profile::Favorites::Info.call(
              params.slice(:profile_id)
            )
          end
        end
      end
    end
  end
end
