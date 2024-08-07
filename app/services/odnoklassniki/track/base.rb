module Odnoklassniki
  module Track
    class Base < Odnoklassniki::Base
      ENDPOINT_NAME = 'play'.freeze

      include Odnoklassniki::Utils::Track

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
        { tid: @args[:track_id] }
      end

      def data
        { track: track_data }
      end

      def track
        response_data['track']
      end
    end
  end
end
