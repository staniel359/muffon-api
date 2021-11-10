module Bandcamp
  module Search
    class Artists
      class Artist < Bandcamp::Search::Artists
        include Muffon::Utils::Artist

        def call
          data
        end

        private

        def data
          muffon_data
            .merge(artist_data)
        end

        def artist_data
          {
            bandcamp_slug: bandcamp_slug,
            bandcamp_model: bandcamp_model,
            name: name,
            image: image_data
          }
        end

        def name
          bandcamp_artist_name(@args.artist)
        end

        def bandcamp_slug
          bandcamp_artist_slug(@args.artist)
        end

        def bandcamp_model
          bandcamp_model_name(@args.artist)
        end

        def image_data
          image_data_formatted(
            @args.artist[:image], 'artist'
          )
        end
      end
    end
  end
end
