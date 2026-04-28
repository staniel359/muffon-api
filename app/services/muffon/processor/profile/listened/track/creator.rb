module Muffon
  module Processor
    module Profile
      module Listened
        module Track
          class Creator < Muffon::Processor::Profile::Base
            include Muffon::Mixins::Track

            private

            def required_args
              [
                *super,
                :track_title,
                :artist_name
              ]
            end

            def data
              listened_track_record

              { listened_track: listened_track_data }
            end

            def listened_track_record
              @listened_track_record ||=
                profile_record
                .listened_tracks
                .where(
                  track_id: track_record.id
                )
                .first_or_create!
            end

            def title
              @args[:track_title]
            end

            def artist_name
              @args[:artist_name]
            end

            def listened_track_data
              { id: listened_track_record.id }
            end
          end
        end
      end
    end
  end
end
