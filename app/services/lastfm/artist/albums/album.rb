module LastFM
  module Artist
    class Albums
      class Album < LastFM::Artist::Albums
        include LastFM::Utils::Album

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
            title:,
            image: image_data,
            listeners_count:
          }.compact
        end

        def artist_name
          album.dig(
            'artist', 'name'
          )
        end

        def album
          @args[:album]
        end
      end
    end
  end
end
