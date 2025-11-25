module YouTube
  module Video
    class Base < YouTube::Base
      include YouTube::Utils::Video

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
        video.blank?
      end

      def video
        raw_collection[0]
      end

      def raw_collection
        response_data['items'] || []
      end

      def link
        "#{BASE_LINK}/videos"
      end

      def params
        super.merge(
          video_params
        )
      end

      def video_params
        {
          id: @args[:video_id],
          part: 'snippet,statistics'
        }
      end

      def data
        { video: video_data }
      end

      def video_data
        {
          source: source_data,
          title:,
          channel: channel_data
        }
      end
    end
  end
end
