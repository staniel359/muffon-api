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
              id: favorite_album.id,
              title: album.title,
              artist: artist_names_data,
              artists:,
              image: favorite_album.image_data
            }.compact
          end

          def favorite_album
            @args[:favorite_album]
          end

          def album
            @album ||= favorite_album.album
          end

          def artists
            [artist_data]
          end

          def artist_data
            { name: artist.name }
          end

          def artist
            album.artist
          end
        end
      end
    end
  end
end
