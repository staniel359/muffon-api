module AmazonMusic
  module Track
    class Base < AmazonMusic::Base
      def call
        check_args

        check_if_not_found

        data
      end

      private

      def required_args
        %i[track_id]
      end

      def not_found?
        raw_track_data.blank?
      end

      def raw_track_data
        response_data.dig(
          'data',
          'track'
        )
      end

      def data
        { track: track_data }
      end
    end
  end
end
