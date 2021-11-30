module API
  module V1
    module LastFM
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

        def tags
          render_data_with_status
        end

        private

        def artists_data
          ::LastFM::Search::Artists.call(
            params.slice(
              *%i[query profile_id page limit]
            )
          )
        end

        def albums_data
          ::LastFM::Search::Albums.call(
            params.slice(
              *%i[query profile_id page limit]
            )
          )
        end

        def tracks_data
          ::LastFM::Search::Tracks.call(
            params.slice(
              *%i[query profile_id page limit]
            )
          )
        end

        def tags_data
          ::LastFM::Search::Tags.call(
            params.slice(
              *%i[query page limit]
            )
          )
        end
      end
    end
  end
end
