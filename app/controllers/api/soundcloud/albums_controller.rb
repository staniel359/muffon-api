module API
  module SoundCloud
    class AlbumsController < API::BaseController
      def info; end

      def description; end

      def tags; end

      private

      def info_data
        ::SoundCloud::Album::Info.call(
          params.slice(
            *%i[album_id profile_id]
          )
        )
      end

      def description_data
        ::SoundCloud::Album::Description.call(
          params.slice(
            *%i[album_id]
          )
        )
      end

      def tags_data
        ::SoundCloud::Album::Tags.call(
          params.slice(
            *%i[album_id]
          )
        )
      end
    end
  end
end
