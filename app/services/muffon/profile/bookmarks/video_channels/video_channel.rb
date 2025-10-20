module Muffon
  module Profile
    module Bookmarks
      class VideoChannels
        class VideoChannel < YouTube::Base
          include YouTube::Utils::Channel

          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              bookmark_video_channel
            ]
          end

          def data
            self_data
              .merge(bookmark_video_channel_data)
          end

          def bookmark_video_channel_data
            {
              source: source_data,
              id: bookmark_video_channel.id,
              title:,
              image: image_data,
              created: created_formatted
            }.compact
          end

          def youtube_id
            video_channel.youtube_id
          end

          def video_channel
            @video_channel ||=
              bookmark_video_channel.video_channel
          end

          def bookmark_video_channel
            @args[:bookmark_video_channel]
          end

          def title
            video_channel.title
          end

          def image_data
            image_data_formatted(
              image:
            )
          end

          def image
            video_channel.image_url
          end

          def videos_count
            nil
          end

          def subscribers_count
            nil
          end

          def views_count
            nil
          end

          def publish_date
            nil
          end

          def created_formatted
            datetime_formatted(
              bookmark_video_channel.created_at
            )
          end
        end
      end
    end
  end
end
