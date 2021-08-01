module Muffon
  module Profile
    module Library
      class Tracks
        class Track
          class Destroyer < Muffon::Profile::Library::Base
            private

            def primary_args
              [
                @args.profile_id,
                @args.token,
                @args.track_id
              ]
            end

            def data
              return forbidden if wrong_profile?

              profile_track&.destroy

              return errors_data if errors?

              { success: true }
            end

            def profile_track
              @profile_track ||=
                profile.profile_tracks.find_by(
                  id: @args.track_id
                )
            end

            def errors?
              profile_track&.errors&.any?
            end
          end
        end
      end
    end
  end
end
