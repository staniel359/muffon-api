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
              title: title,
              player_id: player_id,
              artist: artist_formatted,
              artists: artists
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

          def artists
            [artist_data_formatted]
          end

          def artist_data_formatted
            track.artist.slice(
              :name
            )
          end
        end
      end
    end
  end
end
