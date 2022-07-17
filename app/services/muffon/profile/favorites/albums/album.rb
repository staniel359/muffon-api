module Muffon
  module Profile
    module Favorites
      class Albums
        class Album < Muffon::Profile::Favorites::Albums
          include Muffon::Utils::Album

          def call
            data
          end

          private

          def data
            muffon_data
              .merge(favorite_album_data)
          end

          def title
            album.title
          end

          def album
            @album ||= favorite_album.album
          end

          def artist_name
            artist.name
          end

          def artist
            album.artist
          end

          def favorite_album_data
            {
              id: favorite_album.id,
              title:,
              artist: artist_names_data,
              artists:,
              image: favorite_album.image_data
            }.compact
          end

          def favorite_album
            @args[:favorite_album]
          end

          def artists
            [artist_data]
          end

          def artist_data
            { name: artist_name }
          end
        end
      end
    end
  end
end
