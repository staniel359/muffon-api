module Muffon
  module Profile
    module Favorites
      class Artists
        class Artist
          class Destroyer < Muffon::Profile::Base
            private

            def primary_args
              [
                @args.profile_id,
                @args.token,
                @args.favorite_id
              ]
            end

            def data
              return forbidden if wrong_profile?

              favorite_artist&.destroy

              return errors_data if errors?

              { success: true }
            end

            def favorite_artist
              @favorite_artist ||=
                profile.favorite_artists.find_by(
                  id: @args.favorite_id
                )
            end

            def errors?
              favorite_artist&.errors&.any?
            end
          end
        end
      end
    end
  end
end
