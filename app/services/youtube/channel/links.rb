module YouTube
  module Channel
    class Links < YouTube::Channel::Info
      private

      def channel_data
        Muffon::Formatter::Source::VideoChannel::Links.call(
          source_original_link:,
          source_name:,
          source_video_channel_id: youtube_id
        )
      end
    end
  end
end
