module API
  module Muffon
    module Profiles
      module Library
        class AlbumsController < API::Muffon::Profiles::LibraryController
          def index; end

          def create; end

          def info; end

          def tracks; end

          def playlists; end

          def destroy; end

          private

          def index_data
            ::Muffon::Profile::Library::Albums.call(
              params.slice(
                *%i[
                  profile_id other_profile_id
                  token page limit order
                ]
              )
            )
          end

          def create_data
            ::Muffon::Processor::Profile::Library::Album::Creator.call(
              params.slice(
                *%i[
                  profile_id token title
                  artist tracks image source
                ]
              )
            )
          end

          def info_data
            ::Muffon::Profile::Library::Album::Info.call(
              params.slice(
                *%i[
                  profile_id other_profile_id
                  token library_id
                ]
              )
            )
          end

          def tracks_data
            ::Muffon::Profile::Library::Album::Tracks.call(
              params.slice(
                *%i[
                  profile_id other_profile_id
                  token library_id page limit order
                ]
              )
            )
          end

          def playlists_data
            ::Muffon::Profile::Library::Album::Playlists.call(
              params.slice(
                *%i[
                  profile_id token library_id
                  page limit order
                ]
              )
            )
          end

          def destroy_data
            ::Muffon::Processor::Profile::Library::Album::Destroyer.call(
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
