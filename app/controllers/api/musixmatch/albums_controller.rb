module API
  module MusixMatch
    class AlbumsController < API::BaseController
      def info; end

      def links; end

      private

      def info_data
        ::MusixMatch::Album::Info.call(
          params.slice(
            *%i[
              album_slug
              profile_id
              token
            ]
          )
        )
      end

      def links_data
        ::MusixMatch::Album::Links.call(
          params.slice(
            *%i[
              album_slug
            ]
          )
        )
      end
    end
  end
end
