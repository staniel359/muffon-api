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
          }.compact
        end

        def name
          model_artist_name(
            artist
          )
        end

        def artist
          @args[:artist]
        end

        def bandcamp_slug
          model_artist_slug(
            artist
          )
        end

        def bandcamp_model
          model_name(
            artist
          )
        end

        def image_data
          image_data_formatted(
            artist[:image]
          )
        end
      end
    end
  end
end
