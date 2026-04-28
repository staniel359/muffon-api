module Muffon
  module Processor
    module Profile
      module Recommendation
        module Track
          class Creator < Muffon::Processor::Profile::Recommendation::Base
            include Muffon::Mixins::Track

            private

            def required_args
              [
                *super,
                :artist_name,
                :track_title
              ]
            end

            def data
              recommendation_record

              recommendation_record.library_track_ids |=
                [@args[:library_track_id]]

              recommendation_record.save
            end

            def recommendation_record
              @recommendation_record ||=
                profile_record
                .recommendation_tracks
                .where(
                  track_id: track_record.id
                )
                .first_or_initialize
            end

            def artist_name
              @args[:artist_name]
            end

            def title
              @args[:track_title]
            end
          end
        end
      end
    end
  end
end
