module YouTube
  module Search
    class Channels
      class Channel < YouTube::Base
        include YouTube::Mixins::VideoChannel

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            raw_video_channel_data
          ]
        end

        def data
          update_video_channel_record!

          Muffon::Formatter::Source::Search::VideoChannels::VideoChannel.call(
            video_channel_record:,
            **self_args
          )
        end

        def raw_video_channel_data
          @args[:raw_video_channel_data]
        end

        def youtube_id
          raw_video_channel_data.dig(
            'id',
            'channelId'
          )
        end
      end
    end
  end
end
