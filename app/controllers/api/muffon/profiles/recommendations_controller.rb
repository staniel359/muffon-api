module API
  module Muffon
    module Profiles
      class RecommendationsController < API::Muffon::ProfilesController
        def index
          render_data_with_status
        end

        def info
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
          ::Muffon::Profile::Recommendations.call(
            params.slice(
              *%i[
                profile_id token page limit
                filter filter_value
                hide_library_artists tracks_count
              ]
            )
          )
        end

        def info_data
          ::Muffon::Profile::Recommendation::Info.call(
            params.slice(
              *%i[profile_id token recommendation_id]
            )
          )
        end

        def artists_data
          ::Muffon::Profile::Recommendation::Artists.call(
            params.slice(
              *%i[profile_id token recommendation_id page limit]
            )
          )
        end

        def destroy_data
          ::Muffon::Processor::Profile::Recommendation::Deleter.call(
            params.slice(
              *%i[profile_id token recommendation_id]
            )
          )
        end
      end
    end
  end
end
