module API
  module YouTube
    class VideosController < API::BaseController
      def info; end

      def description; end

      def tags; end

      def related; end

      private

      def info_data
        ::YouTube::Video::Info.call(
          params.slice(
            *%i[video_id profile_id token]
          )
        )
      end

      def description_data
        ::YouTube::Video::Description.call(
          params.slice(
            *%i[video_id]
          )
        )
      end

      def tags_data
        ::YouTube::Video::Tags.call(
          params.slice(
            *%i[video_id]
          )
        )
      end

      def related_data
        ::YouTube::Video::Related.call(
          params.slice(
            *%i[video_id profile_id token page limit]
          )
        )
      end
    end
  end
end
