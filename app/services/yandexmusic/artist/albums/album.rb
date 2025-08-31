module YandexMusic
  module Artist
    class Albums
      class Album < YandexMusic::Artist::Albums
        include YandexMusic::Utils::Album

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            album
          ]
        end

        def data
          self_data
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
            artist: artists_minimal_data,
            artists:
          }.compact
        end

        def album_extra_data
          {
            image: image_data,
            release_date:,
            listeners_count:
          }.compact
        end
      end
    end
  end
end
