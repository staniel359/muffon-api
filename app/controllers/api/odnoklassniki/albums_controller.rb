module API
  module Odnoklassniki
    class AlbumsController < API::BaseController
      def info; end

      def tags; end

      def links; end

      private

      def info_data
        ::Odnoklassniki::Album::Info.call(
          params.slice(
            *%i[album_id profile_id token]
          )
        )
      end

      def tags_data
        ::Odnoklassniki::Album::Tags.call(
          params.slice(
            *%i[album_id]
          )
        )
      end

      def links_data
        ::Odnoklassniki::Album::Links.call(
          params.slice(
            *%i[album_id]
          )
        )
      end
    end
  end
end
