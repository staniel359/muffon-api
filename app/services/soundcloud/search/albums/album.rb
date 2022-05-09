module SoundCloud
  module Search
    class Albums
      class Album < SoundCloud::Search::Albums
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
            image: image_data
          }.compact
        end

        def album
          @args[:album]
        end
      end
    end
  end
end
