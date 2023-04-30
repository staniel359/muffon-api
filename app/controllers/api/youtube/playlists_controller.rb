module API
  module YouTube
    class PlaylistsController < API::BaseController
      def info; end

      def description; end

      def videos; end

      def links; end

      private

      def info_data
        ::YouTube::Playlist::Info.call(
          params.slice(
            *%i[playlist_id profile_id token]
          )
        )
      end

      def description_data
        ::YouTube::Playlist::Description.call(
          params.slice(
            *%i[playlist_id profile_id token]
          )
        )
      end

      def videos_data
        ::YouTube::Playlist::Videos.call(
          params.slice(
            *%i[playlist_id profile_id token page limit]
          )
        )
      end

      def links_data
        ::YouTube::Playlist::Links.call(
          params.slice(
            *%i[playlist_id]
          )
        )
      end
    end
  end
end
