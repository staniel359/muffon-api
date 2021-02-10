module Bandcamp
  module Album
    class Base < Bandcamp::API::Album::Base
      private

      def bandcamp_album_title
        @args.album
      end

      def bandcamp_album_type
        @args.album_type || 'album'
      end

      def data
        { album: album_data }
      end
    end
  end
end
