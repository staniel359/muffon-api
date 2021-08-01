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
          {
            library_id: library_id,
            title: title,
            soundcloud_id: soundcloud_id,
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
