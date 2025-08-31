module Odnoklassniki
  module Track
    class Base < Odnoklassniki::Base
      ENDPOINT_NAME = 'play'.freeze

      include Odnoklassniki::Utils::Track

      def call
        check_args

        return retry_with_new_session_id if retry_with_new_session_id?

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

      def params
        {
          **super,
          tid: @args[:track_id]
        }
      end

      def data
        { track: track_data }
      end

      def track
        response_data['track']
      end
    end
  end
end
