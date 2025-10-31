module API
  module Genius
    class AlbumsController < API::BaseController
      def info; end

      def description; end

      def links; end

      private

      def info_data
        ::Genius::Album::Info.call(
          params.slice(
            *%i[
              album_id
              profile_id
              token
            ]
          )
        )
      end

      def description_data
        ::Genius::Album::Description.call(
          params.slice(
            *%i[
              album_id
            ]
          )
        )
      end

      def links_data
        ::Genius::Album::Links.call(
          params.slice(
            *%i[
              album_id
            ]
          )
        )
      end
    end
  end
end
