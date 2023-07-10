module Deezer
  module Search
    class Artists
      class Artist < Deezer::Search::Artists
        include Deezer::Utils::Artist

        def call
          data
        end

        private

        def data
          self_data
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
            image, 'artist'
          ) || super
        end

        def image
          artist['ART_PICTURE']
        end
      end
    end
  end
end
