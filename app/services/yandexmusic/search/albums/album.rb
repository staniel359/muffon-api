module YandexMusic
  module Search
    class Albums
      class Album < YandexMusic::Search::Albums
        include YandexMusic::Utils::Album

        def call
          data
        end

        private

        def data
          muffon_data
            .merge(album_base_data)
            .merge(album_extra_data)
        end

        def album_base_data
          {
            source_id: SOURCE_ID,
            yandex_music_id: yandex_music_id,
            title: title,
            extra_title: extra_title,
            artist: artist_formatted,
            artists: artists
          }.compact
        end

        def album
          @album ||= @args.album
        end

        def album_extra_data
          {
            image: image_data,
            release_date: release_date
          }
        end
      end
    end
  end
end
