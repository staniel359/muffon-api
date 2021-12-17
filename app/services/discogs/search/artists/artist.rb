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
          muffon_data
            .merge(artist_data)
        end

        def artist_data
          {
            discogs_id: discogs_id,
            name: name,
            image: image_data
          }.compact
        end

        def artist
          @args[:artist]
        end

        def image
          artist['cover_image']
        end
      end
    end
  end
end
