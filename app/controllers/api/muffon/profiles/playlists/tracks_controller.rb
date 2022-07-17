module API
  module Muffon
    module Profiles
      module Playlists
        class TracksController < API::Muffon::ProfilesController
          def index
            render_data_with_status
          end

          def create
            render_data_with_status
          end

          def destroy
            render_data_with_status
          end

          private

          def index_data
            ::Muffon::Profile::Playlist::Tracks.call(
              params.slice(
                *%i[
                  profile_id playlist_id
                  page limit other_profile_id
                ]
              )
            )
          end

          def create_data
            ::Muffon::Processor::Profile::Playlist::Track::Creator.call(
              params.slice(
                *%i[
                  profile_id token playlist_id title
                  artist_name album_title image_url
                  source_data audio_data album_source_data
                ]
              )
            )
          end

          def destroy_data
            ::Muffon::Processor::Profile::Playlist::Track::Destroyer.call(
              params.slice(
                *%i[profile_id token playlist_id playlist_track_id]
              )
            )
          end
        end
      end
    end
  end
end
