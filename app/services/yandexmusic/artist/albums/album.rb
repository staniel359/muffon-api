module YandexMusic
  module Artist
    class Albums
      class Album < YandexMusic::Artist::Albums
        include YandexMusic::Utils::Album

        def call
          data
        end

        private

        def data
          muffon_data
            .merge(album_data)
        end

        def album_data
          {
            source_id:,
            yandex_music_id:,
            title:,
            extra_title:,
            image: image_data,
            release_date:,
            listeners_count:
          }.compact
        end

        def album
          @args[:album]
        end
      end
    end
  end
end
