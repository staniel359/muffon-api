module YouTube
  module Playlist
    class Links < YouTube::Playlist::Info
      private

      def playlist_data
        { links: source_links_data }
      end
    end
  end
end
