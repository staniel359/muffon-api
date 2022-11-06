module API
  module Muffon
    module Profiles
      module Playlists
        class TracksController < API::Muffon::ProfilesController
          def index; end

          def create; end

          def destroy; end

          private

          def index_data
            ::Muffon::Profile::Playlist::Tracks.call(
              params.slice(
                *%i[
                  profile_id other_profile_id
                  token playlist_id page limit order
                ]
              )
            )
          end

          def create_data
            ::Muffon::Processor::Profile::Playlist::Track::Creator.call(
              params.slice(
                *%i[
                  profile_id token playlist_id
                  title artist album image
                  source audio album_source
                ]
              )
            )
          end

          def destroy_data
            ::Muffon::Processor::Profile::Playlist::Track::Destroyer.call(
              params.slice(
                *%i[
                  profile_id token playlist_id
                  playlist_track_id
                ]
              )
            )
          end
        end
      end
    end
  end
end
