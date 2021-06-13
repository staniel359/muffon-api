module Genius
  module Album
    class Base < Genius::Base
      include Genius::Utils::Album

      private

      def primary_args
        [@args.album_id]
      end

      def no_data?
        album.blank?
      end

      def album
        @album ||= response_data.dig(
          'response', 'album'
        )
      end

      def link
        "#{BASE_LINK}/albums/#{@args.album_id}"
      end

      def data
        { album: album_data }
      end
    end
  end
end
