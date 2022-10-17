module API
  module YouTube
    class PlaylistsController < API::BaseController
      def info; end

      def videos; end

      private

      def info_data
        ::YouTube::Playlist::Info.call(
          params.slice(
            *%i[playlist_id]
          )
        )
      end

      def videos_data
        ::YouTube::Playlist::Videos.call(
          params.slice(
            *%i[playlist_id page limit]
          )
        )
      end
    end
  end
end
