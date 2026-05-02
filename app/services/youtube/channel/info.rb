module YouTube
  module Channel
    class Info < YouTube::Channel::Base
      include YouTube::Mixins::VideoChannel

      private

      def request_params
        {
          **super,
          id: @args[:channel_id],
          part: 'snippet,contentDetails,statistics'
        }
      end

      def channel_data
        update_video_channel_record!

        Muffon::Formatter::Source::VideoChannel::Info.call(
          video_channel_record:,
          description:,
          **self_args
        )
      end
    end
  end
end
