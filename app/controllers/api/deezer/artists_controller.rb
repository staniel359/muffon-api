module API
  module Deezer
    class ArtistsController < API::BaseController
      def albums; end

      private

      def albums_data
        ::Deezer::Artist::Albums.call(
          params.slice(
            *%i[
              artist_id album_type profile_id
              token page limit language
            ]
          )
        )
      end
    end
  end
end
