module API
  module V2
    module Muffon
      class PlaylistsController < API::V2::BaseController
        def index
          render_data_with_status
        end

        private

        def index_data
          ::Muffon::Playlists.call(
            params.slice(
              *%i[page limit]
            )
          )
        end
      end
    end
  end
end