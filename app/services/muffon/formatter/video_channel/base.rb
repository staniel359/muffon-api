module Muffon
  module Formatter
    module VideoChannel
      class Base < Muffon::Formatter::Base
        include Muffon::Mixins::VideoChannel

        private

        def source_data
          {
            name: source_name,
            id: source_video_channel_id,
            links: source_links_data
          }
        end

        def source_name
          @args[:source_name]
        end

        def source_video_channel_id
          @args[:source_video_channel_id]
        end

        def source_streaming_link
          nil
        end

        def title
          @args[:title]
        end

        def image_data
          @args[:image_data]
        end

        def creation_date
          @args[:creation_date]
        end

        def views_count
          @args[:views_count]
        end

        def subscribers_count
          @args[:subscribers_count]
        end

        def videos_count
          @args[:videos_count]
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

        def youtube_id
          source_data[:id]
        end
      end
    end
  end
end
