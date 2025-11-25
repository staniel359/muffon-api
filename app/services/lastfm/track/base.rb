module LastFM
  module Track
    class Base < LastFM::Base
      API_METHOD = 'track.getInfo'.freeze

      include LastFM::Utils::Track

      def call
        check_args

        check_if_not_found

        data
      end

      private

      def required_args
        %i[
          artist_name
          track_title
        ]
      end

      def not_found?
        track.blank?
      end

      def track
        response_data['track']
      end

      def params
        {
          **super,
          **track_params
        }
      end

      def data
        { track: track_data }
      end
    end
  end
end
