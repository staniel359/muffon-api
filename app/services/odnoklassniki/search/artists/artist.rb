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
            odnoklassniki_id: odnoklassniki_id,
            name: name,
            image: image_data
          }
        end

        def name
          artist['name']
        end

        def artist
          @args[:artist]
        end

        def odnoklassniki_id
          artist['id']
        end

        def image_data
          image_data_formatted(
            artist['image'], 'artist'
          )
        end
      end
    end
  end
end
