module Muffon
  module Processor
    module Profile
      module Bookmarks
        module VideoChannel
          class Creator < Muffon::Processor::Profile::Base
            private

            def required_args
              [
                *super,
                :youtube_id
              ]
            end

            def data
              bookmark_video_channel_record

              {
                bookmark_video_channel:
                  bookmark_video_channel_data
              }
            end

            def bookmark_video_channel_record
              @bookmark_video_channel_record ||=
                profile_record
                .bookmark_video_channels
                .where(
                  video_channel_id:
                    video_channel_record.id
                )
                .first_or_create!
            end

            def video_channel_record
              ::VideoChannel.find_by(
                youtube_id: @args[:youtube_id]
              )
            end

            def bookmark_video_channel_data
              { id: bookmark_video_channel_record.id }
            end
          end
        end
      end
    end
  end
end
