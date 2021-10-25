module Muffon
  module Profile
    module Listened
      module Artists
        module Artist
          class Destroyer < Muffon::Profile::Base
            private

            def primary_args
              [
                @args.profile_id,
                @args.token,
                @args.listened_id
              ]
            end

            def data
              return forbidden if wrong_profile?

              listened_artist&.destroy

              return errors_data if errors?

              { success: true }
            end

            def listened_artist
              @listened_artist ||=
                profile.listened_artists.find_by(
                  id: @args.listened_id
                )
            end

            def errors?
              listened_artist&.errors&.any?
            end
          end
        end
      end
    end
  end
end
