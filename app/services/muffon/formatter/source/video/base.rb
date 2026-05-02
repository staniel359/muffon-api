module Muffon
  module Formatter
    module Source
      module Video
        class Base < Muffon::Formatter::Base
          include Muffon::Mixins::Video

          private

          def video_record
            @args[:video_record]
          end

          def source_data
            video_record.source_data(
              source_name:
            )
          end

          def source_name
            @args[:source_name] || 'youtube'
          end

          def title
            video_record.title
          end

          def channel_data
            video_record.video_channel_data(
              source_name:
            )
          end

          def image_data
            video_record.image_data
          end

          def publish_date
            video_record.publish_date
          end

          def artist_data
            @args[:artist_data]
          end

          def views_count
            video_record.views_count
          end

          def likes_count
            @args[:likes_count]
          end

          def dislikes_count
            @args[:dislikes_count]
          end

          def duration
            @args[:duration]
          end
        end
      end
    end
  end
end
