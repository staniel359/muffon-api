module Spotify
  module Connection
    class Base < Spotify::Base
      def call
        check_args

        check_if_not_found

        check_if_forbidden

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
