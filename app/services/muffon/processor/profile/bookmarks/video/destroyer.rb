module Muffon
  module Processor
    module Profile
      module Bookmarks
        module Video
          class Destroyer < Muffon::Processor::Profile::Base
            private

            def required_args
              [
                *super,
                :bookmark_id
              ]
            end

            def data
              bookmark_video_record.destroy!

              { success: true }
            end

            def bookmark_video_record
              profile_record
                .bookmark_videos
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
