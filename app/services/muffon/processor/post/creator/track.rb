module Muffon
  module Processor
    module Post
      class Creator
        class Track < Muffon::Processor::Post::Creator
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
