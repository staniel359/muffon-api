module Muffon
  module Profile
    module Favorites
      class Videos
        class Video < YouTube::Base
          include YouTube::Utils::Video

          def call
            data
          end

          private

          def data
            self_data
              .merge(favorite_video_data)
          end

          def favorite_video_data
            {
              source: source_data,
              id: favorite_video.id,
              title:,
              channel: channel_data,
              image: image_data,
              created: created_formatted
            }.compact
          end

          def youtube_id
            video.youtube_id
          end

          def video
            @video ||=
              favorite_video.video
          end

          def favorite_video
            @args[:favorite_video]
          end

          def title
            video.title
          end

          def channel_youtube_id
            video.channel_youtube_id
          end

          def channel_title
            video.channel_title
          end

          def image
            video.image_url
          end

          def publish_date
            nil
          end

          def created_formatted
            datetime_formatted(
              favorite_video.created_at
            )
          end
        end
      end
    end
  end
end
