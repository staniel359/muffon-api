module Odnoklassniki
  module Search
    class Artists
      class Artist < Odnoklassniki::Search::Artists
        include Odnoklassniki::Utils::Artist

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
            image
          ) || super
        end

        def image
          artist['image']
        end
      end
    end
  end
end
