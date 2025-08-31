module LastFM
  module Tag
    class Albums
      class Album < LastFM::Tag::Albums
        include LastFM::Utils::Album

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

        def title
          album['name']
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

        def image_data
          image_data_formatted(
            image
          )
        end

        def image
          album.dig(
            'image', -1, '#text'
          )
        end
      end
    end
  end
end
