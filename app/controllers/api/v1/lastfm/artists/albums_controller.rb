module API
  module V1
    module LastFM
      module Artists
        class AlbumsController < ArtistsController
          def info
            render_data_with_status
          end

          def description
            render_data_with_status
          end

          def tags
            render_data_with_status
          end

          def listeners_count
            update_album_listeners_count

            render_data_with_status
          end

          private

          def info_data
            ::LastFM::Album::Info.call(
              params.slice(
                *%i[artist album profile_id]
              )
            )
          end

          def description_data
            ::LastFM::Album::Description.call(
              params.slice(
                *%i[artist album]
              )
            )
          end

          def tags_data
            ::LastFM::Album::Tags.call(
              params.slice(
                *%i[artist album]
              )
            )
          end

          def listeners_count_data
            ::LastFM::Album::ListenersCount.call(
              params.slice(
                *%i[artist album]
              )
            )
          end

          def update_album_listeners_count
            ::Muffon::Updater::Album::ListenersCount.call(
              data.slice(:album)
            )
          end
        end
      end
    end
  end
end
