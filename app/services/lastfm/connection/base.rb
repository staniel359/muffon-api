module LastFM
  module Connection
    class Base < LastFM::Base
      private

      def primary_args
        [
          @args[:profile_id],
          @args[:token]
        ]
      end

      def no_data?
        profile.blank?
      end

      def forbidden?
        !valid_profile?
      end

      def data
        process_profile
      end
    end
  end
end
