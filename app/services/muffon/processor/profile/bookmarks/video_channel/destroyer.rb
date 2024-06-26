module Muffon
  module Processor
    module Profile
      module Bookmarks
        module VideoChannel
          class Destroyer < Muffon::Processor::Profile::Bookmarks::Base
            private

            def primary_args
              super + [
                @args[:bookmark_id]
              ]
            end

            def process_bookmark
              bookmark_video_channel&.destroy

              { success: true }
            end

            def bookmark_video_channel
              @bookmark_video_channel ||=
                profile
                .bookmark_video_channels
                .find_by(
                  id: @args[:bookmark_id]
                )
            end
          end
        end
      end
    end
  end
end
