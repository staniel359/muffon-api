module API
  module V1
    module Genius
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
          ::Genius::Search::Artists.call(
            params.slice(
              *%i[query profile_id page limit]
            )
          )
        end

        def albums_data
          ::Genius::Search::Albums.call(
            params.slice(
              *%i[query profile_id page limit]
            )
          )
        end

        def tracks_data
          ::Genius::Search::Tracks.call(
            params.slice(
              *%i[query profile_id page limit]
            )
          )
        end
      end
    end
  end
end
