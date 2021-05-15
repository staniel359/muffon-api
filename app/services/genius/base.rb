module Genius
  class Base < Muffon::Base
    def call
      return handlers.bad_request if not_all_args?
      return handlers.not_found if no_data?

      data
    end

    private

    def no_data?
      false
    end

    def image_data(image)
      Genius::Utils::Image.call(image: image)
    end

    def album_released(album)
      Genius::Utils::Album::Released.call(album: album)
    end
  end
end
