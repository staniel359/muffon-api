module YouTube
  module Channel
    class Info < YouTube::Channel::Base
      include YouTube::Mixins::VideoChannel

      private

      def params
        {
          **super,
          id: @args[:channel_id],
          part: 'snippet,contentDetails,statistics'
        }
      end

      def channel_data
        update_record_data!

        Muffon::Formatter::Source::VideoChannel::Info.call(
          source_original_link:,
          source_name:,
          source_video_channel_id: youtube_id,
          title:,
          image_data:,
          description:,
          creation_date:,
          videos_count:,
          views_count:,
          subscribers_count:,
          **self_args
        )
      end
    end
  end
end
