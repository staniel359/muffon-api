module API
  module V2
    module Muffon
      module Profiles
        class CommunitiesController < API::V2::Muffon::ProfilesController
          def index
            render_data_with_status
          end

          private

          def index_data
            ::Muffon::Profile::Communities.call(
              params.slice(
                *%i[profile_id page limit]
              )
            )
          end
        end
      end
    end
  end
end
