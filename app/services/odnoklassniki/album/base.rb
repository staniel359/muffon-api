module Odnoklassniki
  module Album
    class Base < Odnoklassniki::Base
      ENDPOINT_NAME = 'album'.freeze

      include Odnoklassniki::Utils::Album

      def call
        check_args

        check_if_not_found

        return retry_with_new_session_id if retry_with_new_session_id?

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
        album.blank?
      end

      def album
        response_data['album']
      end

      def params
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
