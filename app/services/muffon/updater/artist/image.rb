module Muffon
  module Updater
    module Artist
      class Image < Muffon::Base
        def call
          return if artist_name.blank?

          update_artist_image
        end

        private

        def artist_name
          @artist_name ||= @args.data.dig(
            :artist, :name
          )
        end

        def update_artist_image
          artist.update(image_url: image_url)
        end

        def artist
          ::Artist.with_name(artist_name)
        end

        def image_url
          data_image_url || default_image_url
        end

        def data_image_url
          @args.data.dig(
            :artist, :images, 0, :medium
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
