module Bandcamp
  module Search
    class Artists
      class Artist < Bandcamp::Search::Artists
        include Bandcamp::Utils::Artist

        def call
          data
        end

        private

        def data
          self_data
            .merge(artist_data)
        end

        def name
          model_artist_name(
            artist
          )
        end

        def artist
          @args[:artist]
        end

        def artist_data
          {
            source: source_data,
            name:,
            image: image_data,
            listeners_count:
          }.compact
        end

        def source_data
          {
            name: source_name,
            slug: bandcamp_slug,
            model: bandcamp_model
          }
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

        def image
          artist[:image]
        end
      end
    end
  end
end
