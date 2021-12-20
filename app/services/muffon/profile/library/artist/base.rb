module Muffon
  module Profile
    module Library
      module Artist
        class Base < Muffon::Profile::Library::Base
          include Muffon::Utils::Library::Artist

          private

          def primary_args
            [
              @args[:profile_id],
              @args[:library_id]
            ]
          end

          def no_data?
            super || profile_artist.blank?
          end

          def profile_artist
            @profile_artist ||=
              profile.profile_artists.find_by(
                id: @args[:library_id]
              )
          end

          def library_data
            { artist: artist_data }
          end
        end
      end
    end
  end
end
