module YouTube
  module Channel
    class Info < YouTube::Channel::Base
      private

      def channel_data
        self_data
          .merge(channel_base_data)
          .merge(channel_statistics_data)
          .merge(with_more_data)
      end

      def channel_base_data
        {
          source: source_data,
          title:,
          description:
            description_truncated,
          image: image_data,
          publish_date:
        }.compact
      end

      def channel_statistics_data
        {
          views_count:,
          subscribers_count:,
          videos_count:
        }
      end
    end
  end
end
