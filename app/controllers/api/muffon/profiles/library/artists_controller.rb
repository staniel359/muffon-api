module API
  module Muffon
    module Profiles
      module Library
        class ArtistsController < API::Muffon::Profiles::LibraryController
          def index
            render_data_with_status
          end

          def create
            render_data_with_status
          end

          def info
            render_data_with_status
          end

          def albums
            render_data_with_status
          end

          def tracks
            render_data_with_status
          end

          def playlists
            render_data_with_status
          end

          def destroy
            render_data_with_status
          end

          private

          def index_data
            ::Muffon::Profile::Library::Artists.call(
              params.slice(
                *%i[profile_id page limit other_profile_id]
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
                *%i[profile_id library_id other_profile_id]
              )
            )
          end

          def albums_data
            ::Muffon::Profile::Library::Artist::Albums.call(
              params.slice(
                *%i[
                  profile_id library_id page limit
                  other_profile_id
                ]
              )
            )
          end

          def tracks_data
            ::Muffon::Profile::Library::Artist::Tracks.call(
              params.slice(
                *%i[
                  profile_id library_id page limit
                  other_profile_id
                ]
              )
            )
          end

          def playlists_data
            ::Muffon::Profile::Library::Artist::Playlists.call(
              params.slice(
                *%i[profile_id library_id page limit]
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
