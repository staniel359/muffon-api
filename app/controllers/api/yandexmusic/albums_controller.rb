module API
  module YandexMusic
    class AlbumsController < API::BaseController
      def info; end

      def tags; end

      def links; end

      private

      def info_data
        ::YandexMusic::Album::Info.call(
          params.slice(
            *%i[album_id profile_id token language]
          )
        )
      end

      def tags_data
        ::YandexMusic::Album::Tags.call(
          params.slice(
            *%i[album_id]
          )
        )
      end

      def links_data
        ::YandexMusic::Album::Links.call(
          params.slice(
            *%i[album_id]
          )
        )
      end
    end
  end
end
