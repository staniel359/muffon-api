module Odnoklassniki
  module Track
    class Base < Odnoklassniki::Base
      ENDPOINT_NAME = 'play'.freeze

      def call
        check_args

        return retry_with_new_session_id if retry_with_new_session_id?

        check_if_forbidden

        data
      rescue Faraday::BadRequestError
        raise not_found_error
      end

      private

      def required_args
        %i[
          track_id
        ]
      end

      def forbidden?
        response_data['error'] == 'error.copyright.restriction'
      end

      def request_params
        {
          **super,
          tid: @args[:track_id]
        }
      end

      def raw_track_data
        response_data['track']
      end

      def data
        { track: track_data }
      end
    end
  end
end
