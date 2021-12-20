module Muffon
  module Processor
    module Profile
      module Bookmarks
        module Artist
          class Destroyer < Muffon::Processor::Profile::Bookmarks::Base
            private

            def primary_args
              super + [
                @args[:bookmark_id]
              ]
            end

            def process_bookmark
              bookmark_artist&.destroy

              { success: true }
            end

            def bookmark_artist
              @bookmark_artist ||=
                profile.bookmark_artists.find_by(
                  id: @args[:bookmark_id]
                )
            end
          end
        end
      end
    end
  end
end
