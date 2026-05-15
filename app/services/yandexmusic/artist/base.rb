module YandexMusic
  module Artist
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
          artist_id
        ]
      end

      def data
        { artist: artist_data }
      end

      def artist_data
        { name: }
      end

      def artist_info_data
        YandexMusic::Artist::Info.call(
          artist_id: @args[:artist_id]
        )
      end

      def request_url
        "#{REQUEST_BASE_URL}/artists/#{@args[:artist_id]}"
      end
    end
  end
end
