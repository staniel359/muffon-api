module API
  module V1
    module Bandcamp
      class SearchController < API::V1::BaseController
        def artists
          render_data_with_status
        end

        def albums
          render_data_with_status
        end

        def tracks
          render_data_with_status
        end

        private

        def artists_data
          ::Bandcamp::Search::Artists.call(
            params.slice(
              *%i[query profile_id page limit]
            )
          )
        end

        def albums_data
          ::Bandcamp::Search::Albums.call(
            params.slice(
              *%i[query profile_id page limit]
            )
          )
        end

        def tracks_data
          ::Bandcamp::Search::Tracks.call(
            params.slice(
              *%i[query profile_id page limit]
            )
          )
        end
      end
    end
  end
end
