module Muffon
  module Radio
    class Base < Muffon::Base
      def call
        check_args

        check_if_not_found

        data
      end

      private

      def not_found?
        radio_track_data.blank?
      end

      def random_track_number
        return 1 if test?

        rand(1..tracks_limit)
      end

      def tracks_limit
        self.class::TRACKS_LIMIT
      end

      def random_artist_number
        return 1 if test?

        rand(1..artists_limit)
      end

      def artists_limit
        self.class::ARTISTS_LIMIT
      end

      def data
        { radio: radio_data }
      end

      def radio_data
        { track: radio_track_data }
      end
    end
  end
end
