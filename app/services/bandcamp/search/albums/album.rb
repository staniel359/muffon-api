module Bandcamp
  module Search
    class Albums
      class Album < Bandcamp::Search::Albums
        def call
          data
        end

        private

        def data
          {
            title: title,
            bandcamp_slug: bandcamp_slug,
            bandcamp_model: bandcamp_model,
            artist: artist_formatted,
            artists: artists,
            image: image_data
          }
        end

        def title
          model_title(@args.album)
        end

        def bandcamp_slug
          bandcamp_title_slug(@args.album)
        end

        def bandcamp_model
          bandcamp_model_name(@args.album)
        end

        def artists
          [artist_data_formatted(@args.album)]
        end

        def image_data
          image_data_formatted(
            @args.album[:image]
          )
        end
      end
    end
  end
end
