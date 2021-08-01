module Muffon
  module Profile
    module Library
      class Albums
        class Album
          class Destroyer < Muffon::Profile::Library::Base
            private

            def primary_args
              [
                @args.profile_id,
                @args.token,
                @args.album_id
              ]
            end

            def data
              return forbidden if wrong_profile?

              profile_album&.destroy

              return errors_data if errors?

              { success: true }
            end

            def profile_album
              @profile_album ||=
                profile.profile_albums.find_by(
                  id: @args.album_id
                )
            end

            def errors?
              profile_album&.errors&.any?
            end
          end
        end
      end
    end
  end
end
