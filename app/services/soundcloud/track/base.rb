module SoundCloud
  module Track
    class Base < SoundCloud::API::V2::Base
      include SoundCloud::Utils::Track

      def call
        check_args

        data
      rescue Faraday::UnauthorizedError
        retry_with_new_client_id
      rescue Faraday::ResourceNotFound, Faraday::ServerError
        raise not_found_error
      end

      private

      def required_args
        %i[
          track_id
        ]
      end

      def link
        "#{BASE_LINK}/tracks/#{@args[:track_id]}"
      end

      def data
        { track: track_data }
      end

      alias track response_data
    end
  end
end
