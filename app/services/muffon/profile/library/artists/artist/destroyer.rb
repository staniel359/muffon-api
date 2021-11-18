module Muffon
  module Profile
    module Library
      class Artists
        class Artist
          class Destroyer < Muffon::Profile::Library::Base
            private

            def primary_args
              [
                @args[:profile_id],
                @args[:token],
                @args[:library_id]
              ]
            end

            def data
              return forbidden if wrong_profile?

              profile_artist&.destroy

              return errors_data if errors?

              { success: true }
            end

            def profile_artist
              @profile_artist ||=
                profile.profile_artists.find_by(
                  id: @args[:library_id]
                )
            end

            def errors?
              profile_artist&.errors&.any?
            end
          end
        end
      end
    end
  end
end
