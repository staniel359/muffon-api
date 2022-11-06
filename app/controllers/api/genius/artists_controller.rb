module API
  module Genius
    class ArtistsController < API::BaseController
      def albums; end

      private

      def albums_data
        ::Genius::Artist::Albums.call(
          params.slice(
            *%i[artist_id profile_id token page limit]
          )
        )
      end
    end
  end
end
