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

        def album_data
          {
            source_id: SOURCE_ID,
            discogs_id:,
            title:,
            artists:,
            image: image_data,
            release_date:
          }.compact
        end

        def album
          @args[:album]
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
