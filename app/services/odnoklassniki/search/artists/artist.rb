module Odnoklassniki
  module Search
    class Artists
      class Artist < Odnoklassniki::Search::Artists
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
            id: id,
            odnoklassniki_id: odnoklassniki_id,
            name: name,
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
