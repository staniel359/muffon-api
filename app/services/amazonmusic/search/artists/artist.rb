module AmazonMusic
  module Search
    class Artists
      class Artist < AmazonMusic::Search::Artists
        include AmazonMusic::Utils::Artist

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
            image: image_data
          }
        end
      end
    end
  end
end
