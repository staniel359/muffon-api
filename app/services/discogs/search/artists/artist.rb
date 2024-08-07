module Discogs
  module Search
    class Artists
      class Artist < Discogs::Search::Artists
        include Discogs::Utils::Artist

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

        def image
          artist['cover_image']
        end
      end
    end
  end
end
