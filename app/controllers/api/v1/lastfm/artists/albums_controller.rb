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

          def update_album_listeners_count
            Muffon::Updater::Album::ListenersCount.call(
              album: data[:album]
            )
          end
        end
      end
    end
  end
end
