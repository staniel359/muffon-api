module Muffon
  module Processor
    module Profile
      module Bookmarks
        module Album
          class Destroyer < Muffon::Processor::Profile::Bookmarks::Base
            private

            def primary_args
              super + [
                @args[:bookmark_id]
              ]
            end

            def process_bookmark
              return forbidden if wrong_profile?

              bookmark_album&.destroy

              { success: true }
            end

            def bookmark_album
              @bookmark_album ||=
                profile.bookmark_albums.find_by(
                  id: @args[:bookmark_id]
                )
            end
          end
        end
      end
    end
  end
end
