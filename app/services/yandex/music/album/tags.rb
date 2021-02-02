module Yandex
  module Music
    module Album
      class Tags < Yandex::Music::Album::Base
        private

        def album_data
          {
            title: title,
            artist: artist_data,
            tags: tags
          }
        end
      end
    end
  end
end
