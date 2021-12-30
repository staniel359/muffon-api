module API
  module V2
    module YandexMusic
      class SearchController < API::V2::BaseController
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
          ::YandexMusic::Search::Artists.call(
            params.slice(
              *%i[query profile_id page limit]
            )
          )
        end

        def albums_data
          ::YandexMusic::Search::Albums.call(
            params.slice(
              *%i[query profile_id page limit]
            )
          )
        end

        def tracks_data
          ::YandexMusic::Search::Tracks.call(
            params.slice(
              *%i[query profile_id page limit]
            )
          )
        end
      end
    end
  end
end
