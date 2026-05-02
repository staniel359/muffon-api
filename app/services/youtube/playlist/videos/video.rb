module YouTube
  module Playlist
    class Videos
      class Video < YouTube::Base
        include YouTube::Mixins::Video

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            raw_video_data
          ]
        end

        def data
          update_video_record!

          Muffon::Formatter::Source::VideoPlaylist::Videos::Video.call(
            video_record:,
            description:,
            **self_args
          )
        end

        def raw_video_data
          @args[:raw_video_data]
        end

        def youtube_id
          raw_video_data.dig(
            'snippet',
            'resourceId',
            'videoId'
          )
        end

        def channel_youtube_id
          raw_video_data.dig(
            'snippet',
            'videoOwnerChannelId'
          )
        end

        def channel_title
          raw_video_data.dig(
            'snippet',
            'videoOwnerChannelTitle'
          )
        end

        def description
          string_with_newlines_replaced_by_space(
            super
          )
        end
      end
    end
  end
end
