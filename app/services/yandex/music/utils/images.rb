module Yandex
  module Music
    module Utils
      class Images < Yandex::Music::Base
        def call
          data
        end

        private

        def data
          return images_data if image.present?

          default_images_data(@args.model)
        end

        def image
          @image ||=
            @args.data.dig('cover', 'uri') || @args.data['coverUri']
        end

        def images_data
          {
            original: crop_image(1000),
            large: crop_image(600),
            medium: crop_image(300),
            small: crop_image(100),
            extrasmall: crop_image(50)
          }
        end

        def crop_image(size)
          "https://#{image.sub('%%', "#{size}x#{size}")}"
        end
      end
    end
  end
end
