module API
  module V1
    module Profiles
      module Library
        class ArtistsController < API::V1::Profiles::LibraryController
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

          def destroy
            render_data_with_status
          end

          private

          def index_data
            Muffon::Profile::Library::Artists.call(
              params.slice(
                *%i[profile_id limit page]
              )
            )
          end

          def create_data
            Muffon::Profile::Library::Artists::Artist::Creator.call(
              params.slice(
                *%i[profile_id token artist]
              )
            )
          end

          def info_data
            Muffon::Profile::Library::Artist::Info.call(
              params.slice(
                *%i[profile_id artist_id]
              )
            )
          end

          def albums_data
            Muffon::Profile::Library::Artist::Albums.call(
              params.slice(
                *%i[profile_id artist_id page limit]
              )
            )
          end

          def tracks_data
            Muffon::Profile::Library::Artist::Tracks.call(
              params.slice(
                *%i[profile_id artist_id page limit]
              )
            )
          end

          def destroy_data
            Muffon::Profile::Library::Artists::Artist::Destroyer.call(
              params.slice(
                *%i[profile_id token artist_id]
              )
            )
          end
        end
      end
    end
  end
end