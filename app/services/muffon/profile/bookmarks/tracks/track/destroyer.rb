module Muffon
  module Profile
    module Bookmarks
      class Tracks
        class Track
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

              bookmark_track&.destroy

              return errors_data if errors?

              { success: true }
            end

            def bookmark_track
              @bookmark_track ||=
                profile.bookmark_tracks.find_by(
                  id: @args.bookmark_id
                )
            end

            def errors?
              bookmark_track&.errors&.any?
            end
          end
        end
      end
    end
  end
end
