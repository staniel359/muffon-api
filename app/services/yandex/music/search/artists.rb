module Yandex
  module Music
    module Search
      class Artists < Yandex::Music::Search::Base
        private

        def collection_name
          'artists'
        end

        def collection_item_data(artist)
          {
            name: artist['name'],
            image: image_data(artist, 'artist'),
            yandex_music_id: artist['id']
          }
        end
      end
    end
  end
end
