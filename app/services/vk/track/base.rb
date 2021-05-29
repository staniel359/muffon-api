module VK
  module Track
    class Base < VK::Base
      include VK::Utils::Track

      private

      def primary_args
        [@args.track_id]
      end

      def no_data?
        super || track.blank?
      end

      def track
        @track ||= response_data.dig(
          1, 0, 0
        )
      end

      def params
        {
          act: 'reload_audio',
          al: 1,
          ids: @args.track_id
        }
      end

      def data
        { track: track_data }
      end
    end
  end
end
