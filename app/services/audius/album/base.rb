module Audius
  module Album
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
          album_id
        ]
      end

      def data
        { album: album_data }
      end

      def raw_album_data
        response_data.dig(
          'data',
          0
        )
      end

      def request_url
        "#{REQUEST_BASE_URL}/playlists/#{@args[:album_id]}"
      end
    end
  end
end
