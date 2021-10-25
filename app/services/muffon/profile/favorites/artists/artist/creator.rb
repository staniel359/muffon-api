module Muffon
  module Profile
    module Favorites
      class Artists
        class Artist
          class Creator < Muffon::Profile::Base
            private

            def primary_args
              [
                @args.profile_id,
                @args.token,
                @args.artist_id
              ]
            end

            def data
              return forbidden if wrong_profile?

              favorite_artist

              return errors_data if errors?

              { favorite_id: favorite_artist.id }
            end

            def favorite_artist
              @favorite_artist ||=
                profile.favorite_artists.where(
                  artist_id: @args.artist_id
                ).first_or_create
            end

            def errors?
              favorite_artist.errors.any?
            end
          end
        end
      end
    end
  end
end
