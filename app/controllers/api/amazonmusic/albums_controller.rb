module API
  module AmazonMusic
    class AlbumsController < API::BaseController
      def info; end

      def links; end

      private

      def info_data
        ::AmazonMusic::Album::Info.call(
          params.slice(
            *%i[
              album_id
              profile_id
              token
            ]
          )
        )
      end

      def links_data
        ::AmazonMusic::Album::Links.call(
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
