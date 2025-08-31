module LastFM
  module Connection
    class Base < LastFM::Base
      def call
        check_args

        data
      end

      private

      def required_args
        %i[
          profile_id
          token
        ]
      end

      def not_found?
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
