module API
  module V2
    module Discogs
      class ArtistsController < API::V2::BaseController
        def albums
          render_data_with_status
        end

        private

        def albums_data
          ::Discogs::Artist::Albums.call(
            params.slice(
              *%i[artist_id album_type profile_id page limit]
            )
          )
        end
      end
    end
  end
end
