module Muffon
  module Profile
    class Finder < Muffon::Base
      private

      def primary_args
        [@args.token]
      end

      def no_data?
        profile.blank?
      end

      def profile
        @profile ||= ::Profile.find_by(
          token: @args.token
        )
      end

      def data
        { profile: profile_data }
      end

      def profile_data
        profile.slice(
          *%i[email nickname]
        )
      end
    end
  end
end
