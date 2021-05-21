module Bandcamp
  module Search
    class Artists
      class Artist < Bandcamp::Search::Artists
        def call
          data
        end

        private

        def data
          {
            name: name,
            bandcamp_slug: bandcamp_slug,
            bandcamp_model: bandcamp_model,
            image: image_data
          }
        end

        def name
          artist_name(@args.artist)
        end

        def bandcamp_slug
          bandcamp_artist_slug(@args.artist)
        end

        def bandcamp_model
          bandcamp_model_name(@args.artist)
        end

        def image_data
          image_data_formatted(
            @args.artist[:image]
          )
        end
      end
    end
  end
end
