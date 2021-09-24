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
              id: id,
              name: name,
              image: image_data
            }.compact
          end

          def id
            favorite_artist.id
          end

          def favorite_artist
            @favorite_artist ||= @args.artist
          end

          def name
            favorite_artist
              .artist
              .name
          end

          def image_data
            favorite_artist
              .artist
              .image_data
          end
        end
      end
    end
  end
end
