module Muffon
  module Profile
    class Posts
      class Post
        class Track < Muffon::Profile::Posts::Post
          def call
            data
          end

          private

          def data
            {
              title:,
              player_id:,
              artist:
            }
          end

          def title
            track.title
          end

          def track
            @args[:track]
          end

          def player_id
            track.player_id
          end

          def artist_data
            { name: artist.name }
          end

          def artist
            @artist ||= track.artist
          end
        end
      end
    end
  end
end
