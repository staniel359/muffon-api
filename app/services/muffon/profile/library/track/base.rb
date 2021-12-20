module Muffon
  module Profile
    module Library
      module Track
        class Base < Muffon::Profile::Library::Base
          include Muffon::Utils::Library::Track

          private

          def primary_args
            [
              @args[:profile_id],
              @args[:library_id]
            ]
          end

          def no_data?
            super || profile_track.blank?
          end

          def profile_track
            @profile_track ||=
              profile.profile_tracks.find_by(
                id: @args[:library_id]
              )
          end

          def library_data
            { track: track_data }
          end
        end
      end
    end
  end
end
