module LastFM
  module Track
    class Base < LastFM::Base
      API_METHOD = 'track.getInfo'.freeze

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
        raw_track_data.blank?
      end

      def raw_track_data
        response_data['track']
      end

      def request_params
        {
          **super,
          artist: param_formatted(
            @args[:artist_name]
          ),
          track: param_formatted(
            @args[:track_title]
          )
        }
      end

      def data
        { track: track_data }
      end
    end
  end
end
