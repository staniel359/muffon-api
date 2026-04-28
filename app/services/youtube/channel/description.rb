module YouTube
  module Channel
    class Description < YouTube::Channel::Info
      private

      def channel_data
        Muffon::Formatter::Source::VideoChannel::Description.call(
          description:
        )
      end
    end
  end
end
