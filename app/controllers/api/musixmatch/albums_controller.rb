module API
  module MusixMatch
    class AlbumsController < API::BaseController
      def info; end

      def tags; end

      def links; end

      private

      def info_data
        ::MusixMatch::Album::Info.call(
          params.slice(
            *%i[album_id profile_id token]
          )
        )
      end

      def tags_data
        ::MusixMatch::Album::Tags.call(
          params.slice(
            *%i[album_id]
          )
        )
      end

      def links_data
        ::MusixMatch::Album::Links.call(
          params.slice(
            *%i[album_id]
          )
        )
      end
    end
  end
end
