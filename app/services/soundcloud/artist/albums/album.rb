module SoundCloud
  module Artist
    class Albums
      class Album < SoundCloud::Artist::Albums
        include SoundCloud::Utils::Album

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
            soundcloud_id:,
            title:,
            artist: artist_names_data,
            artists:,
            image: image_data,
            release_date:,
            listeners_count:
          }.compact
        end

        def album
          @args[:album]
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
