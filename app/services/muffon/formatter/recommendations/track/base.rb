module Muffon
  module Formatter
    module Recommendations
      module Track
        class Base < Muffon::Formatter::Track::Base
          private

          def track_record
            @track_record ||=
              recommendation_track_record.track
          end

          def recommendation_track_record
            @args[:recommendation_track_record]
          end

          def source_data
            track_record.source_data
          end

          def id
            recommendation_track_record.id
          end

          def artist_data
            {
              **super,
              image: artist_record.image_data
            }.compact
          end

          def tracks_count
            recommendation_track_record.tracks_count
          end
        end
      end
    end
  end
end
