module API
  module VK
    class AlbumsController < API::BaseController
      def info; end

      private

      def info_data
        ::VK::Album::Info.call(
          params.slice(
            *%i[
              album_id owner_id access_key
              profile_id language
            ]
          )
        )
      end
    end
  end
end
