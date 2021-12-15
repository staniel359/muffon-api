module Muffon
  module Profile
    module Message
      class Creator
        class Track < Muffon::Profile::Message::Creator
          include Muffon::Utils::Track

          def call
            data
          end

          private

          def data
            { id: find_track.id }
          end

          def artist_name
            track.dig(
              :artist, :name
            )
          end

          def track
            @args[:track]
          end

          def title
            track[:title]
          end
        end
      end
    end
  end
end
