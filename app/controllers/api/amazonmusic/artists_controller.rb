module API
  module AmazonMusic
    class ArtistsController < API::BaseController
      def albums; end

      private

      def albums_data
        ::AmazonMusic::Artist::Albums.call(
          params.slice(
            *%i[artist_id profile_id token page]
          )
        )
      end
    end
  end
end
