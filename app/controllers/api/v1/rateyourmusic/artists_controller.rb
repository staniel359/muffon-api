module API
  module V1
    module RateYourMusic
      class ArtistsController < API::V1::BaseController
        def albums
          render_data_with_status
        end

        private

        def albums_data
          ::RateYourMusic::Artist::Albums.call(
            params.slice(
              *%i[artist_id album_type profile_id page limit]
            )
          )
        end
      end
    end
  end
end
