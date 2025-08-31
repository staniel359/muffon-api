module MusixMatch
  module Track
    class Base < MusixMatch::Base
      def call
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

      def params
        {
          **super,
          commontrack_id: @args[:track_id]
        }
      end

      def data
        { track: track_data }
      end
    end
  end
end
