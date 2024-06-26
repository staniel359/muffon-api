module API
  module Muffon
    module Profiles
      module Library
        class TracksController < API::Muffon::Profiles::LibraryController
          def index; end

          def create; end

          def info; end

          def albums; end

          def playlists; end

          def destroy; end

          private

          def index_data
            ::Muffon::Profile::Library::Tracks.call(
              params.slice(
                *%i[
                  profile_id other_profile_id
                  token page limit order
                ]
              )
            )
          end

          def create_data
            ::Muffon::Processor::Profile::Library::Track::Creator.call(
              params.slice(
                *%i[
                  profile_id token track_title
                  artist_name album_title image
                  created source audio album_source
                ]
              )
            )
          end

          def info_data
            ::Muffon::Profile::Library::Track::Info.call(
              params.slice(
                *%i[
                  profile_id other_profile_id
                  token library_id
                ]
              )
            )
          end

          def albums_data
            ::Muffon::Profile::Library::Track::Albums.call(
              params.slice(
                *%i[
                  profile_id other_profile_id
                  token library_id page limit order
                ]
              )
            )
          end

          def playlists_data
            ::Muffon::Profile::Library::Track::Playlists.call(
              params.slice(
                *%i[
                  profile_id other_profile_id
                  token library_id order page limit
                ]
              )
            )
          end

          def destroy_data
            ::Muffon::Processor::Profile::Library::Track::Destroyer.call(
              params.slice(
                *%i[profile_id token library_id]
              )
            )
          end
        end
      end
    end
  end
end
