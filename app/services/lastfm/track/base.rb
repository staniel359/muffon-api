module LastFM
  module Track
    class Base < LastFM::Base
      API_METHOD = 'track.getInfo'.freeze

      include LastFM::Utils::Track

      private

      def primary_args
        [
          @args[:artist_name],
          @args[:track_title]
        ]
      end

      def no_data?
        track.blank?
      end

      def track
        response_data['track']
      end

      def params
        super.merge(
          track_params
        )
      end

      def data
        { track: track_data }
      end
    end
  end
end
