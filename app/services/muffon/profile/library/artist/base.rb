module Muffon
  module Profile
    module Library
      module Artist
        class Base < Muffon::Profile::Library::Base
          private

          def primary_args
            [
              @args.profile_id,
              @args.artist_id
            ]
          end

          def no_data?
            super || profile_artist.blank?
          end

          def profile_artist
            @profile_artist ||=
              profile.profile_artists.find_by(
                id: @args.artist_id
              )
          end

          def library_data
            { artist: artist_data }
          end

          def name
            profile_artist
              .artist
              .name
          end
        end
      end
    end
  end
end
