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
              id: id,
              title: title,
              artist: artist_data,
              image: image_data
            }
          end

          def id
            bookmark_album.id
          end

          def bookmark_album
            @bookmark_album ||= @args.album
          end

          def title
            bookmark_album
              .album
              .title
          end

          def artist_data
            { name: artist_name }
          end

          def artist_name
            bookmark_album
              .album
              .artist
              .name
          end

          def image_data
            LastFM::Utils::Image.call(
              model: 'album',
              image: bookmark_album.image_url
            )
          end
        end
      end
    end
  end
end