module Muffon
  module Profile
    module Library
      module Track
        class Base < Muffon::Profile::Library::Base
          private

          def primary_args
            [
              @args.profile_id,
              @args.track_id
            ]
          end

          def no_data?
            super || profile_track.blank?
          end

          def profile_track
            @profile_track ||=
              profile.profile_tracks.find_by(
                id: @args.track_id
              )
          end

          def library_data
            { track: track_data }
          end

          def title
            profile_track
              .track
              .title
          end

          def artist_data
            {
              id: artist_id,
              name: artist_name
            }
          end

          def artist_id
            profile_track.profile_artist_id
          end

          def artist_name
            profile_track
              .profile_artist
              .artist
              .name
          end
        end
      end
    end
  end
end
