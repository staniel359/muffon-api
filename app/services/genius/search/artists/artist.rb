module Genius
  module Search
    class Artists
      class Artist < Genius::Search::Artists
        def call
          data
        end

        private

        def data
          {
            name: title,
            genius_id: genius_id,
            image: image_data
          }
        end

        def title
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
