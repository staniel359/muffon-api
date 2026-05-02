module YouTube
  module Channel
    class Links < YouTube::Channel::Info
      private

      def channel_data
        Muffon::Formatter::Source::VideoChannel::Links.call(
          video_channel_record:
        )
      end
    end
  end
end
