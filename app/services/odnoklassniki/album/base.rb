module Odnoklassniki
  module Album
    class Base < Odnoklassniki::Base
      ENDPOINT_NAME = 'album'.freeze

      def call
        check_args

        return retry_with_new_session_id if retry_with_new_session_id?

        check_if_not_found

        data
      rescue Faraday::BadRequestError
        raise not_found_error
      end

      private

      def required_args
        %i[
          album_id
        ]
      end

      def not_found?
        raw_album_data.blank?
      end

      def raw_album_data
        response_data['album']
      end

      def request_params
        {
          **super,
          albumId: @args[:album_id]
        }
      end

      def data
        { album: album_data }
      end
    end
  end
end
