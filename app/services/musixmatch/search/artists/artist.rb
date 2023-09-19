module MusixMatch
  module Search
    class Artists
      class Artist < MusixMatch::Search::Artists
        include MusixMatch::Utils::Artist

        def call
          data
        end

        private

        def data
          self_data
            .merge(artist_data)
        end

        def artist
          @args[:artist]['artist']
        end

        def artist_data
          {
            source: source_data,
            name:,
            image: image_data,
            listeners_count:
          }.compact
        end
      end
    end
  end
end
