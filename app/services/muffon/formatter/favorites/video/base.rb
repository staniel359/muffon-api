module Muffon
  module Formatter
    module Favorites
      module Video
        class Base < Muffon::Formatter::Base
          include Muffon::Mixins::Video

          private

          def video_record
            @video_record ||= favorite_video_record.video
          end

          def favorite_video_record
            @args[:favorite_video_record]
          end

          def source_data
            video_record.source_data
          end

          def id
            favorite_video_record.id
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
            favorite_video_record.created_at
          end
        end
      end
    end
  end
end
