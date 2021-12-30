module API
  module V2
    module Discogs
      class SearchController < API::V2::BaseController
        def artists
          render_data_with_status
        end

        def labels
          render_data_with_status
        end

        def groups
          render_data_with_status
        end

        def albums
          render_data_with_status
        end

        private

        def artists_data
          ::Discogs::Search::Artists.call(
            params.slice(
              *%i[query profile_id page limit]
            )
          )
        end

        def labels_data
          ::Discogs::Search::Labels.call(
            params.slice(
              *%i[query page limit]
            )
          )
        end

        def groups_data
          ::Discogs::Search::Groups.call(
            params.slice(
              *%i[query profile_id page limit]
            )
          )
        end

        def albums_data
          ::Discogs::Search::Albums.call(
            params.slice(
              *%i[query profile_id page limit]
            )
          )
        end
      end
    end
  end
end
