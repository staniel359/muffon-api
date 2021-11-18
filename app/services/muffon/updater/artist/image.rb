module Muffon
  module Updater
    module Artist
      class Image < Muffon::Updater::Artist::Base
        private

        def update_artist
          find_artist.update(
            image_url: image_url
          )
        end

        def image_url
          data_image_url || default_image_url
        end

        def data_image_url
          artist.dig(
            :images, 0, :medium
          )
        end

        def default_image_url
          LastFM::Utils::Image.call(
            model: 'artist'
          )[:medium]
        end
      end
    end
  end
end
