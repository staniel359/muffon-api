module Muffon
  module Profile
    module Library
      module Artist
        class Creator < Muffon::Profile::Library::Base
          include Muffon::Utils::Artist

          private

          def primary_args
            [
              @args[:profile_id],
              @args[:token],
              @args[:name]
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
                artist_id: find_artist.id
              ).first_or_create
          end

          def name
            @args[:name]
          end

          def errors?
            profile_artist.errors.any?
          end
        end
      end
    end
  end
end
