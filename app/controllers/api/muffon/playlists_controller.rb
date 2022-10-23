module API
  module Muffon
    class PlaylistsController < API::BaseController
      def index; end

      private

      def index_data
        ::Muffon::Playlists.call(
          params.slice(
            *%i[page limit order]
          )
        )
      end
    end
  end
end
