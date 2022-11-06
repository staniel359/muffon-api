module API
  module VK
    class ArtistsController < API::BaseController
      def albums; end

      private

      def albums_data
        ::VK::Artist::Albums.call(
          params.slice(
            *%i[artist_id profile_id token page limit]
          )
        )
      end
    end
  end
end
