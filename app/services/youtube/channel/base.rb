module YouTube
  module Channel
    class Base < YouTube::Base
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
        raw_video_channel_data.blank?
      end

      def raw_video_channel_data
        raw_collection[0]
      end

      def raw_collection
        response_data['items'] || []
      end

      def request_url
        "#{REQUEST_BASE_URL}/channels"
      end

      def data
        { channel: channel_data }
      end
    end
  end
end
