module Muffon
  module Updater
    module Artist
      class Image < Muffon::Updater::Artist::Base
        private

        def update_artist
          find_artist.process_image(
            image_url
          )
        end

        def image_url
          artist.dig(
            :images, 0, :original
          )
        end
      end
    end
  end
end
