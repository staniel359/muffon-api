module Muffon
  module Profile
    module Messages
      class Message
        class Track < Muffon::Profile::Messages::Message
          def call
            data
          end

          private

          def data
            {
              title: track.title,
              player_id: track.player_id,
              artist: artist_formatted,
              artists: artists
            }
          end

          def track
            @args[:track]
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
