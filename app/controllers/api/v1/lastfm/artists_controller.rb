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
          artist.update(image_url: artist_image_url)

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

        def artist
          Artist.with_name(params[:artist])
        end

        def artist_image_url
          data.dig(:artist, :images, 0, :medium) ||
            artist_default_image_url
        end

        def artist_default_image_url
          ::LastFM::Utils::Image.call(
            model: 'artist'
          )[:medium]
        end
      end
    end
  end
end
