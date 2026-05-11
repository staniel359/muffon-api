module Muffon
  module Formatter
    module Multitag
      module Track
        class Base < Muffon::Formatter::Track::Base
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

          def artist_data
            {
              **super,
              image: artist_record.image_data
            }
          end

          def listeners_count
            track_record.listeners_count
          end
        end
      end
    end
  end
end
