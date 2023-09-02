module API
  module Muffon
    module Profiles
      module Recommendations
        class ArtistsController < API::Muffon::ProfilesController
          def index; end

          def artists; end

          def destroy; end

          private

          def index_data
            ::Muffon::Profile::Recommendations::Artists.call(
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

          def artists_data
            ::Muffon::Profile::Recommendation::Artist::Artists.call(
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
            ::Muffon::Processor::Profile::Recommendation::Artist::Deleter.call(
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
end
