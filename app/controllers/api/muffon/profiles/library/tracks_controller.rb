module API
  module Muffon
    module Profiles
      module Library
        class TracksController < API::Muffon::Profiles::LibraryController
          def index
            render_data_with_status
          end

          def create
            render_data_with_status
          end

          def info
            render_data_with_status
          end

          def destroy
            render_data_with_status
          end

          private

          def index_data
            ::Muffon::Profile::Library::Tracks.call(
              params.slice(
                *%i[profile_id page limit]
              )
            )
          end

          def create_data
            ::Muffon::Processor::Profile::Library::Track::Creator.call(
              params.slice(
                *%i[
                  profile_id token title artist_name
                  album_title image image_url created_at
                ]
              )
            )
          end

          def info_data
            ::Muffon::Profile::Library::Track::Info.call(
              params.slice(
                *%i[profile_id library_id]
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
