module Spotify
  module Album
    class Links < Spotify::Album::Info
      private

      def album_data
        { links: source_links_data }
      end
    end
  end
end
