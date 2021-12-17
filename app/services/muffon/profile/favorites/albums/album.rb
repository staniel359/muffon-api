module Muffon
  module Profile
    module Favorites
      class Albums
        class Album < Muffon::Profile::Favorites::Albums
          def call
            data
          end

          private

          def data
            {
              id: id,
              title: title,
              artist: artist_data,
              image: image_data
            }.compact
          end

          def id
            favorite_album.id
          end

          def favorite_album
            @args[:album]
          end

          def title
            favorite_album
              .album
              .title
          end

          def artist_data
            { name: artist_name }
          end

          def artist_name
            favorite_album
              .album
              .artist
              .name
          end

          def image_data
            favorite_album.image_data
          end
        end
      end
    end
  end
end
