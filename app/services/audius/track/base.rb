module Audius
  module Track
    class Base < Audius::Base
      def call
        check_args

        data
      rescue Faraday::BadRequestError, Faraday::ResourceNotFound
        raise not_found_error
      end

      private

      def required_args
        %i[
          track_id
        ]
      end

      def data
        { track: track_data }
      end

      def raw_track_data
        response_data['data']
      end

      def request_url
        "#{REQUEST_BASE_URL}/tracks/#{@args[:track_id]}"
      end
    end
  end
end
