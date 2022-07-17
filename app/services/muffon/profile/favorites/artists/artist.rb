module Muffon
  module Profile
    module Favorites
      class Artists
        class Artist < Muffon::Profile::Favorites::Artists
          include Muffon::Utils::Artist

          def call
            data
          end

          private

          def data
            muffon_data
              .merge(favorite_artist_data)
          end

          def name
            artist.name
          end

          def artist
            @artist ||=
              favorite_artist.artist
          end

          def favorite_artist
            @args[:favorite_artist]
          end

          def favorite_artist_data
            {
              id: favorite_artist.id,
              name:,
              image: artist.image_data
            }.compact
          end
        end
      end
    end
  end
end
