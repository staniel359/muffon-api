module Bandcamp
  module Search
    class Albums
      class Album < Bandcamp::Search::Albums
        include Bandcamp::Utils::Album

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
            bandcamp_slug:,
            bandcamp_model:,
            title:,
            artists:,
            image: image_data
          }.compact
        end

        def artist_name
          artist_data[:name]
        end

        def artist_data
          @artist_data ||=
            model_artist_data(
              album
            )
        end

        def title
          model_title(album)
        end

        def album
          @args[:album]
        end

        def bandcamp_slug
          model_title_slug(
            album
          )
        end

        def bandcamp_model
          model_name(album)
        end

        def artists
          [artist_data]
        end

        def image_data
          image_data_formatted(
            album[:image]
          )
        end
      end
    end
  end
end
