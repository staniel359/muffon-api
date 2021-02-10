module Bandcamp
  module Album
    class Base < Bandcamp::API::Playlist::Base
      private

      def bandcamp_playlist_id
        @args.album_id
      end

      def bandcamp_playlist_type
        @args.album_type || 'album'
      end

      def data
        { album: album_data }
      end
    end
  end
end
