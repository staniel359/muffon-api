module Discogs
  module Album
    class Base < Discogs::Base
      private

      def primary_args
        [@args.album_id]
      end

      def link
        "#{base_link}/releases/#{@args.album_id}"
      end

      def data
        { album: album_data }
      end
    end
  end
end
