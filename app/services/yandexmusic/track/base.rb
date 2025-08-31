module YandexMusic
  module Track
    class Base < YandexMusic::Base
      include YandexMusic::Utils::Track

      def call
        check_args

        data
      rescue Faraday::ResourceNotFound, Faraday::BadRequestError
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

      def track
        response_data['track']
      end

      def link
        "#{BASE_LINK}/track.jsx"
      end

      def params
        { track: @args[:track_id] }
      end
    end
  end
end
