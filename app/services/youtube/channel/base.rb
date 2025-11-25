module YouTube
  module Channel
    class Base < YouTube::Base
      include YouTube::Utils::Channel

      def call
        check_args

        check_if_not_found

        data
      end

      private

      def required_args
        %i[
          channel_id
        ]
      end

      def not_found?
        channel.blank?
      end

      def channel
        raw_collection[0]
      end

      def raw_collection
        response_data['items'] || []
      end

      def link
        "#{BASE_LINK}/channels"
      end

      def params
        {
          **super,
          id: @args[:channel_id],
          part: 'snippet,contentDetails,statistics'
        }
      end

      def data
        { channel: channel_data }
      end

      def channel_data
        { title: }
      end
    end
  end
end
