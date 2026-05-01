module VK
  module Track
    class Base < VK::Base
      API_METHOD = 'audio.getById'.freeze

      def call
        # TODO: to remove later
        raise not_found_error unless test?

        check_args

        check_if_not_found

        data
      end

      private

      def required_args
        %i[
          track_id
        ]
      end

      def not_found?
        raw_track_data.blank?
      end

      def raw_track_data
        response_data.try(:[], 0)
      end

      def data
        { track: track_data }
      end
    end
  end
end
