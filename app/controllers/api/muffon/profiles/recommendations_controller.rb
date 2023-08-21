module API
  module Muffon
    module Profiles
      class RecommendationsController < API::Muffon::ProfilesController
        def index; end

        def info; end

        def artists; end

        def destroy; end

        private

        def index_data
          ::Muffon::Profile::Recommendations.call(
            params.slice(
              *%i[
                profile_id token
                page limit order
              ],
              *filter_args
            )
          )
        end

        def filter_args
          %i[
            hide_library hide_listened
            hide_library_tracks_count
            tags_include tags_exclude
            artists_include artists_exclude
          ]
        end

        def info_data
          ::Muffon::Profile::Recommendation::Info.call(
            params.slice(
              *%i[
                profile_id token
                recommendation_id
              ]
            )
          )
        end

        def artists_data
          ::Muffon::Profile::Recommendation::Artists.call(
            params.slice(
              *%i[
                profile_id token
                recommendation_id
                page limit
              ]
            )
          )
        end

        def destroy_data
          ::Muffon::Processor::Profile::Recommendation::Deleter.call(
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
