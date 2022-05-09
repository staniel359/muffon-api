module Spotify
  module Album
    class Base < Spotify::Base
      include Spotify::Utils::Album

      private

      def primary_args
        [@args[:album_id]]
      end

      def no_data?
        album.blank?
      end

      def link
        "#{BASE_LINK}/albums/#{@args[:album_id]}"
      end

      def data
        { album: album_data }
      end

      alias album response_data
    end
  end
end
