module API
  module SoundCloud
    class ArtistsController < API::BaseController
      def albums; end

      private

      def albums_data
        ::SoundCloud::Artist::Albums.call(
          params.slice(
            *%i[artist_id profile_id token page limit]
          )
        )
      end
    end
  end
end
