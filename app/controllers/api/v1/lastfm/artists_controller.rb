module API
  module V1
    module LastFM
      class ArtistsController < API::V1::BaseController
        def info
          update_artist_listeners_count

          render_data_with_status
        end

        def description
          render_data_with_status
        end

        def tags
          render_data_with_status
        end

        def images
          update_artist_image

          render_data_with_status
        end

        def similar
          render_data_with_status
        end

        def albums
          render_data_with_status
        end

        def tracks
          render_data_with_status
        end

        def listeners_count
          update_artist_listeners_count

          render_data_with_status
        end

        private

        def update_artist_image
          Muffon::Updater::Artist::Image.call(
            artist: data[:artist]
          )
        end

        def update_artist_listeners_count
          Muffon::Updater::Artist::ListenersCount.call(
            artist: data[:artist]
          )
        end
      end
    end
  end
end
