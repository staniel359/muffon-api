module Muffon
  module Processor
    module Profile
      module Library
        module Track
          class Destroyer < Muffon::Processor::Profile::Base
            private

            def required_args
              [
                *super,
                :library_id
              ]
            end

            def data
              library_track_record.destroy!

              { success: true }
            end

            def library_track_record
              profile_record
                .library_tracks
                .find_by(
                  id: @args[:library_id]
                )
            end
          end
        end
      end
    end
  end
end
