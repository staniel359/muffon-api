module Muffon
  module Profile
    module Bookmarks
      class Artists
        class Artist < Muffon::Profile::Bookmarks::Artists
          def call
            data
          end

          private

          def data
            {
              id: bookmark_artist.id,
              name: artist.name,
              image: artist.image_data
            }.compact
          end

          def bookmark_artist
            @args[:bookmark_artist]
          end

          def artist
            @artist ||= bookmark_artist.artist
          end
        end
      end
    end
  end
end
