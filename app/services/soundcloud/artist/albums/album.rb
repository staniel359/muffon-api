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
            id: id,
            source_id: SOURCE_ID,
            soundcloud_id: soundcloud_id,
            title: title,
            image: image_data,
            release_date: release_date,
            listeners_count: listeners_count
          }.compact
        end

        def album
          @album ||= @args.album
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
