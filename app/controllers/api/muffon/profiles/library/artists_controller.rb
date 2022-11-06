module API
  module Muffon
    module Profiles
      module Library
        class ArtistsController < API::Muffon::Profiles::LibraryController
          def index; end

          def create; end

          def info; end

          def albums; end

          def tracks; end

          def playlists; end

          def destroy; end

          private

          def index_data
            ::Muffon::Profile::Library::Artists.call(
              params.slice(
                *%i[
                  profile_id other_profile_id
                  token page limit order
                ]
              )
            )
          end

          def create_data
            ::Muffon::Processor::Profile::Library::Artist::Creator.call(
              params.slice(
                *%i[profile_id token name]
              )
            )
          end

          def info_data
            ::Muffon::Profile::Library::Artist::Info.call(
              params.slice(
                *%i[
                  profile_id other_profile_id
                  token library_id
                ]
              )
            )
          end

          def albums_data
            ::Muffon::Profile::Library::Artist::Albums.call(
              params.slice(
                *%i[
                  profile_id other_profile_id
                  token library_id page limit order
                ]
              )
            )
          end

          def tracks_data
            ::Muffon::Profile::Library::Artist::Tracks.call(
              params.slice(
                *%i[
                  profile_id other_profile_id
                  token library_id page limit order
                ]
              )
            )
          end

          def playlists_data
            ::Muffon::Profile::Library::Artist::Playlists.call(
              params.slice(
                *%i[
                  profile_id token library_id
                  page limit order
                ]
              )
            )
          end

          def destroy_data
            ::Muffon::Processor::Profile::Library::Artist::Destroyer.call(
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
