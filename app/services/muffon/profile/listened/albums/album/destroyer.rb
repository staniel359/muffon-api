module Muffon
  module Profile
    module Listened
      module Albums
        module Album
          class Destroyer < Muffon::Profile::Base
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

              listened_album&.destroy

              return errors_data if errors?

              { success: true }
            end

            def listened_album
              @listened_album ||=
                profile.listened_albums.find_by(
                  id: @args.album_id
                )
            end

            def errors?
              listened_album&.errors&.any?
            end
          end
        end
      end
    end
  end
end
