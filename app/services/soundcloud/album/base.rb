module SoundCloud
  module Album
    class Base < SoundCloud::API::V2::Base
      include SoundCloud::Utils::Album

      private

      def primary_args
        [@args[:album_id]]
      end

      def no_data?
        album.blank?
      rescue Faraday::ServerError
        true
      end

      def link
        "#{BASE_LINK}/playlists/#{@args[:album_id]}"
      end

      def data
        { album: album_data }
      end

      alias album response_data
    end
  end
end
