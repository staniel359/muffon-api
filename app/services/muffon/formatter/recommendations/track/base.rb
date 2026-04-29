module Muffon
  module Formatter
    module Recommendations
      module Track
        class Base < Muffon::Formatter::Base
          include Muffon::Mixins::Track

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

          def title
            track_record.title
          end

          def artists
            [artist_data]
          end

          def artist_data
            { name: artist_record.name }
          end

          def artist_record
            track_record.artist
          end

          def tracks_count
            recommendation_track_record.tracks_count
          end
        end
      end
    end
  end
end
