module SoundCloud
  module Album
    class Base < SoundCloud::Base
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

      def request_url
        "#{REQUEST_BASE_URL}/playlists/#{@args[:album_id]}"
      end

      def data
        { album: album_data }
      end

      alias raw_album_data response_data
    end
  end
end
