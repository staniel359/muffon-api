module Muffon
  module Processor
    module Profile
      module Listened
        module Track
          class Destroyer < Muffon::Processor::Profile::Base
            private

            def required_args
              [
                *super,
                :listened_id
              ]
            end

            def data
              listened_track_record.destroy!

              { success: true }
            end

            def listened_track_record
              profile_record
                .listened_tracks
                .find_by(
                  id: @args[:listened_id]
                )
            end
          end
        end
      end
    end
  end
end
