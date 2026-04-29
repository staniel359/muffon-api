module Muffon
  module Formatter
    module Bookmarks
      module Video
        class Base < Muffon::Formatter::Base
          include Muffon::Mixins::Video

          private

          def video_record
            @video_record ||= bookmark_video_record.video
          end

          def bookmark_video_record
            @args[:bookmark_video_record]
          end

          def source_data
            video_record.source_data
          end

          def id
            bookmark_video_record.id
          end

          def title
            video_record.title
          end

          def video_channel_data
            video_record.video_channel_data
          end

          def image_data
            video_record.image_data
          end

          def creation_date
            datetime_formatted(
              raw_creation_date
            )
          end

          def raw_creation_date
            bookmark_video_record.created_at
          end
        end
      end
    end
  end
end
