module Muffon
  module Profile
    module Bookmarks
      class Artists
        class Artist < Muffon::Profile::Bookmarks::Artists
          include Muffon::Utils::Artist
          include Muffon::Utils::Source::Artist

          def call
            data
          end

          private

          def data
            self_data
              .merge(bookmark_artist_data)
          end

          def name
            artist.name
          end

          def artist
            @artist ||=
              bookmark_artist.artist
          end

          def bookmark_artist
            @args[:bookmark_artist]
          end

          def bookmark_artist_data
            {
              source: source_data,
              id: bookmark_artist.id,
              name:,
              image: image_data,
              created: created_formatted
            }.compact
          end

          def image_data
            artist.image_data
          end

          def created_formatted
            datetime_formatted(
              bookmark_artist.created_at
            )
          end
        end
      end
    end
  end
end
