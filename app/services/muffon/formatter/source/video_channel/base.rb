module Muffon
  module Formatter
    module Source
      module VideoChannel
        class Base < Muffon::Formatter::Base
          include Muffon::Mixins::VideoChannel

          private

          def video_channel_record
            @args[:video_channel_record]
          end

          def source_data
            video_channel_record.source_data
          end

          def title
            video_channel_record.title
          end

          def image_data
            video_channel_record.image_data
          end

          def publish_date
            video_channel_record.publish_date
          end

          def views_count
            video_channel_record.views_count
          end

          def subscribers_count
            video_channel_record.subscribers_count
          end

          def videos_count
            video_channel_record.videos_count
          end

          def prev_page
            @args[:prev_page]
          end

          def next_page
            @args[:next_page]
          end

          def playlists
            @args[:playlists]
          end

          def videos
            @args[:videos]
          end
        end
      end
    end
  end
end
