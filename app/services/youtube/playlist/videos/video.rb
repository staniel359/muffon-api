module YouTube
  module Playlist
    class Videos
      class Video < YouTube::Playlist::Videos
        include YouTube::Utils::Video

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            video
          ]
        end

        def data
          {
            **self_data,
            source: source_data,
            channel: channel_data,
            title:,
            image: image_data,
            publish_date:,
            description:
              description_truncated
          }.compact
        end

        def video
          @args[:video]
        end

        def youtube_id
          snippet.dig(
            'resourceId',
            'videoId'
          )
        end

        def channel_youtube_id
          snippet['videoOwnerChannelId']
        end

        def channel_title
          snippet['videoOwnerChannelTitle']
        end

        def description_truncated
          text_truncated(
            description_formatted,
            size: 'extrasmall'
          )
        end

        def description_formatted
          string_with_newlines_replaced_by_space(
            description
          )
        end
      end
    end
  end
end
