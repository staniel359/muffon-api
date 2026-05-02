module Muffon
  module Formatter
    module Source
      module VideoPlaylist
        class Base < Muffon::Formatter::Base
          include Muffon::Mixins::VideoPlaylist

          private

          def video_playlist_record
            @args[:video_playlist_record]
          end

          def source_data
            video_playlist_record.source_data(
              source_name:
            )
          end

          def source_name
            @args[:source_name] || 'youtube'
          end

          def title
            video_playlist_record.title
          end

          def channel_data
            video_playlist_record.video_channel_data(
              source_name:
            )
          end

          def image_data
            video_playlist_record.image_data
          end

          def videos_count
            video_playlist_record.videos_count
          end

          def publish_date
            video_playlist_record.publish_date
          end

          def views_count
            @args[:views_count]
          end

          def description
            video_playlist_record.description
          end
        end
      end
    end
  end
end
