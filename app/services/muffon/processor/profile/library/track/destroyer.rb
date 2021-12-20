module Muffon
  module Processor
    module Profile
      module Library
        module Track
          class Destroyer < Muffon::Processor::Profile::Library::Track::Base
            private

            def primary_args
              super + [
                @args[:library_id]
              ]
            end

            def process_profile_track
              profile_track&.destroy

              { success: true }
            end

            def profile_track
              @profile_track ||=
                profile.profile_tracks.find_by(
                  id: @args[:library_id]
                )
            end
          end
        end
      end
    end
  end
end
