module YouTube
  module Video
    class Base < YouTube::Base
      def call
        check_args

        check_if_not_found

        data
      end

      private

      def required_args
        %i[
          video_id
        ]
      end

      def not_found?
        raw_video_data.blank?
      end

      def raw_video_data
        raw_collection[0]
      end

      def raw_collection
        response_data['items'] || []
      end

      def request_url
        "#{REQUEST_BASE_URL}/videos"
      end

      def data
        { video: video_data }
      end
    end
  end
end
