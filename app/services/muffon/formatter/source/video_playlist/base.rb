module Muffon
  module Formatter
    module Source
      module VideoPlaylist
        class Base < Muffon::Formatter::Base
          include Muffon::Mixins::VideoPlaylist

          private

          def source_data
            {
              name: source_name,
              id: source_video_playlist_id,
              links: source_links_data
            }
          end

          def source_name
            @args[:source_name]
          end

          def source_video_playlist_id
            @args[:source_video_playlist_id]
          end

          def source_streaming_link
            nil
          end

          def title
            @args[:title]
          end

          def channel_data
            {
              source: channel_source_data,
              title: channel_title
            }
          end

          def channel_source_data
            {
              name: source_name,
              id: source_video_channel_id
            }.compact
          end

          def source_video_channel_id
            @args[:source_video_channel_id]
          end

          def channel_title
            @args[:channel_title]
          end

          def image_data
            @args[:image_data]
          end

          def videos_count
            @args[:videos_count]
          end

          def publish_date
            video_playlist_record.publish_date
          end

          def views_count
            @args[:views_count]
          end

          def youtube_id
            source_data[:id]
          end
        end
      end
    end
  end
end
