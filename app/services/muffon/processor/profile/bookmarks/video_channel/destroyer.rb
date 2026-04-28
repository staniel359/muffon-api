module Muffon
  module Processor
    module Profile
      module Bookmarks
        module VideoChannel
          class Destroyer < Muffon::Processor::Profile::Base
            private

            def required_args
              [
                *super,
                :bookmark_id
              ]
            end

            def data
              bookmark_video_channel_record.destroy!

              { success: true }
            end

            def bookmark_video_channel_record
              profile_record
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
