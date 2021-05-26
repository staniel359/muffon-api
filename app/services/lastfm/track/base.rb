module LastFM
  module Track
    class Base < LastFM::Base
      API_METHOD = 'track.getInfo'.freeze
      include LastFM::Utils::Track

      private

      def primary_args
        [
          @args.artist,
          @args.track
        ]
      end

      def no_data?
        track.blank?
      end

      def track
        @track ||= response_data['track']
      end

      def params
        super.merge(track_params)
      end

      def data
        { track: track_data }
      end

      def description
        description_formatted(
          track.dig('wiki', 'content')
        )
      end
    end
  end
end
