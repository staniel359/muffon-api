module API
  module V1
    module Profiles
      module Library
        class AlbumsController < API::V1::Profiles::LibraryController
          def index
            render_data_with_status
          end

          def create
            render_data_with_status
          end

          def info
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
            Muffon::Profile::Library::Albums.call(
              params.slice(
                *%i[profile_id limit page]
              )
            )
          end

          def create_data
            Muffon::Profile::Library::Albums::Album::Creator.call(
              params.slice(
                *%i[
                  profile_id token title
                  artist tracks image_url
                ]
              )
            )
          end

          def info_data
            Muffon::Profile::Library::Album::Info.call(
              params.slice(
                *%i[profile_id album_id]
              )
            )
          end

          def tracks_data
            Muffon::Profile::Library::Album::Tracks.call(
              params.slice(
                *%i[profile_id album_id page limit]
              )
            )
          end

          def destroy_data
            Muffon::Profile::Library::Albums::Album::Destroyer.call(
              params.slice(
                *%i[profile_id token album_id]
              )
            )
          end
        end
      end
    end
  end
end
