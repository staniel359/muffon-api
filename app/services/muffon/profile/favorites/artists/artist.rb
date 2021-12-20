module Muffon
  module Profile
    module Favorites
      class Artists
        class Artist < Muffon::Profile::Favorites::Artists
          def call
            data
          end

          private

          def data
            {
              id: favorite_artist.id,
              name: artist.name,
              image: artist.image_data
            }.compact
          end

          def favorite_artist
            @args[:favorite_artist]
          end

          def artist
            @artist ||=
              favorite_artist.artist
          end
        end
      end
    end
  end
end
