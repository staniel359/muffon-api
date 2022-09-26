module Genius
  module Search
    class Artists
      class Artist < Genius::Search::Artists
        include Genius::Utils::Artist

        def call
          data
        end

        private

        def data
          muffon_data
            .merge(artist_data)
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

        def image_data
          image_data_formatted(
            artist['image_url']
          )
        end
      end
    end
  end
end
