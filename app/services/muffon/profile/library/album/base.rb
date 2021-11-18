module Muffon
  module Profile
    module Library
      module Album
        class Base < Muffon::Profile::Library::Base
          private

          def primary_args
            [
              @args[:profile_id],
              @args[:library_id]
            ]
          end

          def no_data?
            super || profile_album.blank?
          end

          def profile_album
            @profile_album ||=
              profile.profile_albums.find_by(
                id: @args[:library_id]
              )
          end

          def library_data
            { album: album_data }
          end

          def title
            profile_album
              .album
              .title
          end

          def artist_data
            {
              id: artist_id,
              name: artist_name
            }
          end

          def artist_id
            profile_album.profile_artist_id
          end

          def artist_name
            profile_album
              .album
              .artist
              .name
          end
        end
      end
    end
  end
end
