module YandexMusic
  module Search
    class Artists
      class Artist < YandexMusic::Search::Artists
        def call
          data
        end

        private

        def data
          {
            name: name,
            yandex_music_id: yandex_music_id,
            image: image_data
          }
        end

        def name
          @args.artist['name']
        end

        def yandex_music_id
          @args.artist['id']
        end

        def image_data
          image_data_formatted(
            @args.artist, 'artist'
          )
        end
      end
    end
  end
end
