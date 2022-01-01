module YandexMusic
  module Search
    class Artists
      class Artist < YandexMusic::Search::Artists
        include Muffon::Utils::Artist

        def call
          data
        end

        private

        def data
          muffon_data
            .merge(artist_data)
        end

        def artist_data
          {
            yandex_music_id:,
            name:,
            image: image_data
          }.compact
        end

        def name
          artist['name']
        end

        def artist
          @args[:artist]
        end

        def yandex_music_id
          artist['id']
        end

        def image_data
          image_data_formatted(
            artist, 'artist'
          )
        end
      end
    end
  end
end
