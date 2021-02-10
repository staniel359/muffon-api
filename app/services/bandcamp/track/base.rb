module Bandcamp
  module Track
    class Base < Bandcamp::API::Album::Base
      private

      def bandcamp_album_title
        @args.track
      end

      def bandcamp_album_type
        'track'
      end

      def data
        { track: track_data }
      end
    end
  end
end
