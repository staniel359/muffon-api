module API
  module Muffon
    module Profiles
      module Recommendations
        class TracksController < API::Muffon::ProfilesController
          def index; end

          def tracks; end

          def destroy; end

          private

          def index_data
            ::Muffon::Profile::Recommendations::Tracks.call(
              params.slice(
                *%i[
                  profile_id
                  token
                  page
                  limit
                  order
                  hide_library_tracks
                  hide_library_artists
                  hide_library_artists_tracks_count
                  hide_listened_tracks
                  hide_listened_artists
                ]
              )
            )
          end

          def tracks_data
            ::Muffon::Profile::Recommendation::Track::Tracks.call(
              params.slice(
                *%i[
                  profile_id
                  token
                  recommendation_id
                  page
                  limit
                ]
              )
            )
          end

          def destroy_data
            ::Muffon::Processor::Profile::Recommendation::Track::Deleter.call(
              params.slice(
                *%i[
                  profile_id
                  token
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
