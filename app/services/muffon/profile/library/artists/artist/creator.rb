module Muffon
  module Profile
    module Library
      class Artists
        class Artist
          class Creator < Muffon::Profile::Library::Base
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

              profile_artist

              return errors_data if errors?

              { library_id: profile_artist.id }
            end

            def profile_artist
              @profile_artist ||=
                profile.profile_artists.where(
                  artist_id: @args.artist_id
                ).first_or_create
            end

            def errors?
              profile_artist.errors.any?
            end
          end
        end
      end
    end
  end
end
