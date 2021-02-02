module Yandex
  module Music
    module Album
      class Tags < Yandex::Music::Album::Base
        private

        def album_data
          {
            title: response_data['title'],
            artist: artist_data,
            tags: tags
          }
        end
      end
    end
  end
end
