module Muffon
  module Formatter
    module Multitag
      module Track
        class Base < Muffon::Formatter::Base
          include Muffon::Mixins::Track

          private

          def track_record
            @args[:track_record]
          end

          def source_data
            track_record.source_data
          end

          def player_id
            track_record.player_id
          end

          def title
            track_record.title
          end

          def artists
            [artist_data]
          end

          def artist_data
            {
              name: artist_record.name,
              image: artist_record.image_data
            }
          end

          def artist_record
            track_record.artist
          end

          def listeners_count
            track_record.listeners_count
          end
        end
      end
    end
  end
end
