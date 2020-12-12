module VK
  module Track
    class Info < VK::Base
      private

      def primary_args
        [@args.track_id]
      end

      def no_data?
        track_data.blank?
      end

      def track_data
        @track_data ||= tracks_data.dig(:tracks, 0)
      end

      def tracks_data
        VK::Utils::Audio.call(ids: [@args.track_id])
      end

      def data
        { track: track_data }
      end
    end
  end
end
