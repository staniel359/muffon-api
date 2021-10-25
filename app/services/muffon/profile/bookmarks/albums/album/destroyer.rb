module Muffon
  module Profile
    module Bookmarks
      class Albums
        class Album
          class Destroyer < Muffon::Profile::Base
            private

            def primary_args
              [
                @args.profile_id,
                @args.token,
                @args.bookmark_id
              ]
            end

            def data
              return forbidden if wrong_profile?

              bookmark_album&.destroy

              return errors_data if errors?

              { success: true }
            end

            def bookmark_album
              @bookmark_album ||=
                profile.bookmark_albums.find_by(
                  id: @args.bookmark_id
                )
            end

            def errors?
              bookmark_album&.errors&.any?
            end
          end
        end
      end
    end
  end
end
