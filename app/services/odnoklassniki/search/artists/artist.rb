module Odnoklassniki
  module Search
    class Artists
      class Artist < Odnoklassniki::Search::Artists
        def call
          data
        end

        private

        def data
          {
            name: name,
            odnoklassniki_id: odnoklassniki_id,
            image: image_data
          }
        end

        def name
          @args.artist['name']
        end

        def odnoklassniki_id
          @args.artist['id']
        end

        def image_data
          image_data_formatted(
            @args.artist['image'], 'artist'
          )
        end
      end
    end
  end
end
