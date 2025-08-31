module Muffon
  module Processor
    module Profile
      module Listened
        module Track
          class Creator < Muffon::Processor::Profile::Listened::Base
            include Muffon::Utils::Track

            private

            def required_args
              super + %i[
                track_title
                artist_name
              ]
            end

            def process_listened
              listened_track

              { listened_track: listened_track_data }
            end

            def listened_track
              @listened_track ||=
                profile
                .listened_tracks
                .where(
                  track_id: find_track.id
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
              { id: listened_track.id }
            end
          end
        end
      end
    end
  end
end
