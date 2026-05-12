module Muffon
  module Radio
    module Recommendations
      class Tracks < Muffon::Radio::Recommendations::Base
        private

        def not_found?
          recommendation_track_record.blank? || super
        end

        def recommendation_track_record
          @recommendation_track_record ||=
            profile_record
            .recommendation_tracks
            .order('random()')
            .first
        end

        def radio_track_data
          Muffon::Formatter::Recommendations::Tracks::Track.call(
            recommendation_track_record:
          )
        end
      end
    end
  end
end
