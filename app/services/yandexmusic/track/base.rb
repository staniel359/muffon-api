module YandexMusic
  module Track
    class Base < YandexMusic::Base
      include YandexMusic::Utils::Track

      private

      def primary_args
        [@args.track_id]
      end

      def no_data?
        track.blank?
      end

      def track
        @track ||= response_data['track']
      end

      def link
        "#{BASE_LINK}/track.jsx"
      end

      def params
        super.merge(track_params)
      end

      def track_params
        { track: @args.track_id }
      end

      def data
        { track: track_data }
      end
    end
  end
end
