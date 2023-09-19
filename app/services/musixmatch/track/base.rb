module MusixMatch
  module Track
    class Base < MusixMatch::Base
      private

      def primary_args
        [@args[:track_id]]
      end

      def params
        super.merge(
          track_params
        )
      end

      def track_params
        { commontrack_id: @args[:track_id] }
      end

      def data
        { track: track_data }
      end
    end
  end
end
