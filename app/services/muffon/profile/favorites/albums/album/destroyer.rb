module Muffon
  module Profile
    module Favorites
      class Albums
        class Album
          class Destroyer < Muffon::Profile::Base
            private

            def primary_args
              [
                @args[:profile_id],
                @args[:token],
                @args[:favorite_id]
              ]
            end

            def data
              return forbidden if wrong_profile?

              favorite_album&.destroy

              return errors_data if errors?

              { success: true }
            end

            def favorite_album
              @favorite_album ||=
                profile.favorite_albums.find_by(
                  id: @args[:favorite_id]
                )
            end

            def errors?
              favorite_album&.errors&.any?
            end
          end
        end
      end
    end
  end
end
