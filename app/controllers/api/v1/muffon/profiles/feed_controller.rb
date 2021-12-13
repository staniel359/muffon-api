module API
  module V1
    module Muffon
      module Profiles
        class FeedController < API::V1::Muffon::ProfilesController
          def index
            render_data_with_status
          end

          private

          def index_data
            ::Muffon::Profile::Feed.call(
              params.slice(
                *%i[profile_id token page limit]
              )
            )
          end
        end
      end
    end
  end
end
