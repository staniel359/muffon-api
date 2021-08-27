module API
  module V1
    module Profiles
      class RecommendationsController < API::V1::ProfilesController
        def index
          render_data_with_status
        end

        def artists
          render_data_with_status
        end

        def destroy
          render_data_with_status
        end

        private

        def index_data
          Muffon::Profile::Recommendations.call(
            params.slice(
              *%i[profile_id token limit page]
            )
          )
        end

        def artists_data
          Muffon::Profile::Recommendations::Recommendation::Artists.call(
            params.slice(
              *%i[
                profile_id token
                recommendation_id
                limit page
              ]
            )
          )
        end

        def destroy_data
          Muffon::Profile::Recommendations::Recommendation::Destroyer.call(
            params.slice(
              *%i[
                profile_id token
                recommendation_id
              ]
            )
          )
        end
      end
    end
  end
end
