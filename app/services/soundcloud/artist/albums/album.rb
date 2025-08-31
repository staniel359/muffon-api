module SoundCloud
  module Artist
    class Albums
      class Album < SoundCloud::Artist::Albums
        include SoundCloud::Utils::Album

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
            .merge(album_data)
        end

        def album
          @args[:album]
        end

        def album_data
          {
            source: source_data,
            title:,
            artist: artists_minimal_data,
            artists:,
            image: image_data,
            release_date:,
            listeners_count:
          }.compact
        end

        def release_date
          date_formatted(
            album['release_date']
          )
        end
      end
    end
  end
end
