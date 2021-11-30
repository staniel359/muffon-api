module API
  module V1
    module Bandcamp
      class IdController < API::V1::BaseController
        def artist
          render_data_with_status
        end

        def album
          render_data_with_status
        end

        def track
          render_data_with_status
        end

        private

        def artist_data
          ::Bandcamp::Id::Artist.call(
            params.slice(:artist)
          )
        end

        def album_data
          ::Bandcamp::Id::Album.call(
            params.slice(
              *%i[artist album]
            )
          )
        end

        def track_data
          ::Bandcamp::Id::Track.call(
            params.slice(
              *%i[artist track]
            )
          )
        end
      end
    end
  end
end
