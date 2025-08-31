module YandexMusic
  module Album
    class Base < YandexMusic::Base
      include YandexMusic::Utils::Album

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

      def link
        "#{BASE_LINK}/album.jsx"
      end

      def params
        { album: @args[:album_id] }
      end

      alias album response_data
    end
  end
end
