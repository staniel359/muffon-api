module Muffon
  module Processor
    module Profile
      module Bookmarks
        module VideoChannel
          class Creator < Muffon::Processor::Profile::Bookmarks::Base
            include Muffon::Utils::VideoChannel

            private

            def required_args
              super + %i[
                youtube_id
              ]
            end

            def process_bookmark
              bookmark_video_channel

              {
                bookmark_video_channel:
                  bookmark_video_channel_data
              }
            end

            def bookmark_video_channel
              @bookmark_video_channel ||=
                profile
                .bookmark_video_channels
                .where(
                  video_channel_id:
                    find_video_channel.id
                )
                .first_or_create!
            end

            def bookmark_video_channel_data
              { id: bookmark_video_channel.id }
            end
          end
        end
      end
    end
  end
end
