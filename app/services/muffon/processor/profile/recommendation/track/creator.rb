module Muffon
  module Processor
    module Profile
      module Recommendation
        module Track
          class Creator < Muffon::Processor::Profile::Recommendation::Base
            include Muffon::Utils::Track

            private

            def required_args
              super + %i[
                artist_name
                track_title
              ]
            end

            def process_recommendation
              recommendation

              add_library_track

              recommendation.save
            end

            def recommendation
              @recommendation ||=
                profile
                .recommendation_tracks
                .where(
                  track_id: find_track.id
                )
                .first_or_initialize
            end

            def artist_name
              @args[:artist_name]
            end

            def title
              @args[:track_title]
            end

            def add_library_track
              return if library_track_present?

              recommendation.library_track_ids <<
                @args[:library_track_id]
            end

            def library_track_present?
              @args[:library_track_id].in?(
                recommendation.library_track_ids
              )
            end
          end
        end
      end
    end
  end
end
