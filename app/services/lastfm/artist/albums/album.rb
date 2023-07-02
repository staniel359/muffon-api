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
          self_data
            .merge(album_data)
        end

        def album
          @args[:album]
        end

        def artist_name
          album.dig(
            'artist', 'name'
          )
        end

        def album_data
          {
            source: source_data,
            title:,
            artist: artists_minimal_data,
            artists:,
            image: image_data,
            listeners_count:
          }.compact
        end

        def artist_data
          {
            source: artist_source_data,
            name: artist_name
          }
        end
      end
    end
  end
end
