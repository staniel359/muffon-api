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

        def album
          @args[:album]
        end

        def album_base_data
          {
            source: source_data,
            title:,
            extra_title:,
            artist: artist_names_data,
            artists:
          }.compact
        end

        def album_extra_data
          {
            image: image_data,
            release_date:
          }.compact
        end
      end
    end
  end
end
