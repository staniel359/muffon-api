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

            def not_found?
              super || bookmark_video_channel_record.blank?
            end

            def bookmark_video_channel_record
              if defined?(@bookmark_video_channel_record)
                @bookmark_video_channel_record
              else
                @bookmark_video_channel_record =
                  profile_record
                  .bookmark_video_channels
                  .find_by(
                    id: @args[:bookmark_id]
                  )
              end
            end

            def data
              bookmark_video_channel_record.destroy!

              { success: true }
            end
          end
        end
      end
    end
  end
end
