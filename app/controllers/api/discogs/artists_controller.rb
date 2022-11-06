module API
  module Discogs
    class ArtistsController < API::BaseController
      def albums; end

      private

      def albums_data
        ::Discogs::Artist::Albums.call(
          params.slice(
            *%i[
              artist_id album_type
              profile_id token page limit
            ]
          )
        )
      end
    end
  end
end
