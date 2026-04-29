module Muffon
  module Formatter
    module Bookmarks
      module VideoChannel
        class Base < Muffon::Formatter::Base
          include Muffon::Mixins::VideoChannel

          private

          def video_channel_record
            @video_channel_record ||=
              bookmark_video_channel_record.video_channel
          end

          def bookmark_video_channel_record
            @args[:bookmark_video_channel_record]
          end

          def source_data
            video_channel_record.source_data
          end

          def id
            bookmark_video_channel_record.id
          end

          def title
            video_channel_record.title
          end

          def image_data
            video_channel_record.image_data
          end

          def creation_date
            datetime_formatted(
              raw_creation_date
            )
          end

          def raw_creation_date
            bookmark_video_channel_record.created_at
          end
        end
      end
    end
  end
end
