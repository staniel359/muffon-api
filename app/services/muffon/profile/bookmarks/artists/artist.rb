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
              id: id,
              name: name,
              image: image_data
            }.compact
          end

          def id
            bookmark_artist.id
          end

          def bookmark_artist
            @args[:artist]
          end

          def name
            bookmark_artist
              .artist
              .name
          end

          def image_data
            bookmark_artist
              .artist
              .image_data
          end
        end
      end
    end
  end
end
