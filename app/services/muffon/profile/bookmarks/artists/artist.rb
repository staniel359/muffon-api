module Muffon
  module Profile
    module Bookmarks
      class Artists
        class Artist < Muffon::Profile::Bookmarks::Artists
          include Muffon::Utils::Artist

          def call
            data
          end

          private

          def data
            muffon_data
              .merge(bookmark_artist_data)
          end

          def name
            artist.name
          end

          def artist
            @artist ||= bookmark_artist.artist
          end

          def bookmark_artist
            @args[:bookmark_artist]
          end

          def bookmark_artist_data
            {
              id: bookmark_artist.id,
              name:,
              image: artist.image_data
            }.compact
          end
        end
      end
    end
  end
end
