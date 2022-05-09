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
            source_id:,
            title:,
            artist: artist_names_data,
            artists:,
            bandcamp_slug:,
            bandcamp_model:,
            image: image_data
          }.compact
        end

        def title
          model_title(album)
        end

        def album
          @args[:album]
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

        def bandcamp_slug
          model_title_slug(
            album
          )
        end

        def bandcamp_model
          model_name(album)
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
