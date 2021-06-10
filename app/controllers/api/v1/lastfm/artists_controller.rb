module API
  module V1
    module LastFM
      class ArtistsController < API::V1::BaseController
        def info
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

        private

        def update_artist_image
          Muffon::Updater::Artist::Image.call(
            artist: data[:artist]
          )
        end
      end
    end
  end
end
