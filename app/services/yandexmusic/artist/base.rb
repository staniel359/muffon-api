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

      def name
        raw_artist_data.dig(
          'artist',
          'name'
        )
      end

      def request_url
        "#{REQUEST_BASE_URL}/artist.jsx"
      end

      def request_params
        { artist: @args[:artist_id] }
      end

      alias raw_artist_data response_data
    end
  end
end
