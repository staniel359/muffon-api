module Muffon
  module Formatter
    module Source
      module Video
        class Base < Muffon::Formatter::Base
          include Muffon::Mixins::Video

          private

          def source_data
            {
              name: source_name,
              id: source_video_id,
              links: source_links_data
            }
          end

          def source_name
            @args[:source_name]
          end

          def source_video_id
            @args[:source_video_id]
          end

          def source_streaming_link
            Muffon::Formatter::Source::StreamingLink.call(
              model: 'video',
              source_name:,
              source_model_id: source_video_id
            )
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

          def channel_title
            @args[:channel_title]
          end

          def source_video_channel_id
            @args[:source_video_channel_id]
          end

          def image_data
            @args[:image_data]
          end

          def creation_date
            @args[:creation_date]
          end

          def artist_data
            @args[:artist_data]
          end

          def views_count
            @args[:views_count]
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

          def youtube_id
            source_data[:id]
          end
        end
      end
    end
  end
end
