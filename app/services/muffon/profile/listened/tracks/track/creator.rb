module Muffon
  module Profile
    module Listened
      module Tracks
        module Track
          class Creator < Muffon::Profile::Base
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

              listened_track

              return errors_data if errors?

              { listened_id: listened_track.id }
            end

            def listened_track
              @listened_track ||=
                profile.listened_tracks.where(
                  track_id: @args.track_id
                ).first_or_create
            end

            def errors?
              listened_track.errors.any?
            end
          end
        end
      end
    end
  end
end
