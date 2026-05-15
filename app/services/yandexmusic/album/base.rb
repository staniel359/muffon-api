module YandexMusic
  module Album
    class Base < YandexMusic::Base
      def call
        check_args

        data
      rescue Faraday::ResourceNotFound, Faraday::BadRequestError
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

      def request_url
        "#{REQUEST_BASE_URL}/albums/#{@args[:album_id]}/with-tracks"
      end

      alias raw_album_data response_data
    end
  end
end
