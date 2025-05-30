module API
  module VK
    class AlbumsController < API::BaseController
      def info; end

      def links; end

      private

      def info_data
        ::VK::Album::Info.call(
          params.slice(
            *%i[
              album_id owner_id access_key
              profile_id token language
            ]
          )
        )
      end

      def links_data
        ::VK::Album::Links.call(
          params.slice(
            *%i[album_id owner_id access_key]
          )
        )
      end
    end
  end
end
