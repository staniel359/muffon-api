module Muffon
  module Processor
    module Profile
      module Bookmarks
        module Track
          class Destroyer < Muffon::Processor::Profile::Bookmarks::Base
            private

            def primary_args
              super + [
                @args[:bookmark_id]
              ]
            end

            def process_bookmark
              bookmark_track&.destroy

              { success: true }
            end

            def bookmark_track
              @bookmark_track ||=
                profile.bookmark_tracks.find_by(
                  id: @args[:bookmark_id]
                )
            end
          end
        end
      end
    end
  end
end
