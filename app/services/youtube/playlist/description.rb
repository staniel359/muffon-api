module YouTube
  module Playlist
    class Description < YouTube::Playlist::Info
      private

      def playlist_data
        { description: }
      end
    end
  end
end
