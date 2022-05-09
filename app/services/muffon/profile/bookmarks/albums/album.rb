module Muffon
  module Profile
    module Bookmarks
      class Albums
        class Album < Muffon::Profile::Bookmarks::Albums
          def call
            data
          end

          private

          def data
            {
              id: bookmark_album.id,
              title: album.title,
              artist: artist_names_data,
              artists:,
              image: bookmark_album.image_data
            }.compact
          end

          def bookmark_album
            @args[:bookmark_album]
          end

          def album
            @album ||= bookmark_album.album
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
