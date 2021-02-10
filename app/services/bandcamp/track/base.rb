module Bandcamp
  module Track
    class Base < Bandcamp::API::Playlist::Base
      private

      def bandcamp_playlist_id
        @args.track_id
      end

      def bandcamp_playlist_type
        'track'
      end

      def data
        { track: track_data }
      end
    end
  end
end
