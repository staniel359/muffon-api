module Muffon
  module Profile
    module Favorites
      class Tracks
        class Track
          class Destroyer < Muffon::Profile::Base
            private

            def primary_args
              [
                @args[:profile_id],
                @args[:token],
                @args[:favorite_id]
              ]
            end

            def data
              return forbidden if wrong_profile?

              favorite_track&.destroy

              return errors_data if errors?

              { success: true }
            end

            def favorite_track
              @favorite_track ||=
                profile.favorite_tracks.find_by(
                  id: @args[:favorite_id]
                )
            end

            def errors?
              favorite_track&.errors&.any?
            end
          end
        end
      end
    end
  end
end
