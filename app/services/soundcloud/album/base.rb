module SoundCloud
  module Album
    class Base < SoundCloud::API::V2::Base
      include SoundCloud::Utils::Album

      def call
        check_args

        data
      rescue Faraday::UnauthorizedError
        retry_with_new_client_id
      rescue Faraday::ServerError, Faraday::ResourceNotFound
        raise not_found_error
      end

      private

      def required_args
        %i[
          album_id
        ]
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
