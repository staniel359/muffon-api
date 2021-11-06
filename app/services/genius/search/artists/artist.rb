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
          {
            id: id,
            genius_id: genius_id,
            name: name,
            image: image_data
          }
        end

        def name
          @args.artist['name']
        end

        def genius_id
          @args.artist['id']
        end

        def image_data
          image_data_formatted(
            @args.artist['image_url']
          )
        end
      end
    end
  end
end
