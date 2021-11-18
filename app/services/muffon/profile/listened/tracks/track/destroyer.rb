module Muffon
  module Profile
    module Listened
      module Tracks
        module Track
          class Destroyer < Muffon::Profile::Base
            private

            def primary_args
              [
                @args[:profile_id],
                @args[:token],
                @args[:listened_id]
              ]
            end

            def data
              return forbidden if wrong_profile?

              listened_track&.destroy

              return errors_data if errors?

              { success: true }
            end

            def listened_track
              @listened_track ||=
                profile.listened_tracks.find_by(
                  id: @args[:listened_id]
                )
            end

            def errors?
              listened_track&.errors&.any?
            end
          end
        end
      end
    end
  end
end
