module Genius
  module Search
    class Artists
      class Artist < Genius::Search::Artists
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
            genius_id: genius_id,
            name: name,
            image: image_data
          }.compact
        end

        def name
          artist['name']
        end

        def artist
          @args[:artist]
        end

        def genius_id
          artist['id']
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
