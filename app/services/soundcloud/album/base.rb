module SoundCloud
  module Album
    class Base < SoundCloud::API::V1::Base
      include SoundCloud::Utils::Album

      private

      def primary_args
        [@args.album_id]
      end

      def no_data?
        album.blank?
      end

      def album
        @album ||= response_data
      end

      def link
        "#{BASE_LINK}/playlists/#{@args.album_id}"
      end

      def data
        { album: album_data }
      end
    end
  end
end
