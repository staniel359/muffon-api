module Discogs
  module Label
    class Albums
      class Album < Discogs::Label::Albums
        include Discogs::Utils::Album

        def call
          data
        end

        private

        def data
          muffon_data
            .merge(album_data)
        end

        def album
          @args[:album]
        end

        def album_data
          {
            source: source_data,
            title:,
            artist: artist_names_data,
            artists:,
            image: image_data,
            release_date:
          }.compact
        end

        def artists
          [artist_data]
        end

        def artist_data
          { name: artist_name }
        end

        def artist_name
          artist_name_formatted(
            album['artist']
          )
        end

        def image
          album['thumb']
        end
      end
    end
  end
end
