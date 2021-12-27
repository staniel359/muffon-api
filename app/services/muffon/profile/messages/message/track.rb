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
              artist: artist_data
            }
          end

          def track
            @args[:track]
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
