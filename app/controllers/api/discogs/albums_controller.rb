module API
  module Discogs
    class AlbumsController < API::BaseController
      def info; end

      def description; end

      def tags; end

      def links; end

      private

      def info_data
        ::Discogs::Album::Info.call(
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
        ::Discogs::Album::Description.call(
          params.slice(
            *%i[
              album_id
            ]
          )
        )
      end

      def tags_data
        ::Discogs::Album::Tags.call(
          params.slice(
            *%i[
              album_id
            ]
          )
        )
      end

      def links_data
        ::Discogs::Album::Links.call(
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
