module MusicBrainz
  module Track
    class Base < MusicBrainz::Base
      def call
        check_args

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

      def request_url
        "#{REQUEST_BASE_URL}/recording/#{@args[:track_id]}"
      end

      def request_params
        {
          **super,
          inc: 'artist-credits+tags+releases'
        }
      end

      def data
        { track: track_data }
      end

      alias raw_track_data response_data
    end
  end
end
