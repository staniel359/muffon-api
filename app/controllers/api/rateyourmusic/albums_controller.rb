module API
  module RateYourMusic
    class AlbumsController < API::BaseController
      def info
        render_data_with_status
      end

      def tags
        render_data_with_status
      end

      private

      def info_data
        ::RateYourMusic::Album::Info.call(
          params.slice(
            *%i[album profile_id]
          )
        )
      end

      def tags_data
        ::RateYourMusic::Album::Tags.call(
          params.slice(:album)
        )
      end
    end
  end
end
