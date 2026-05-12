module Spotify
  module Connection
    class Base < Spotify::Base
      include Muffon::Mixins::Profile

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
        profile_record.blank?
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
