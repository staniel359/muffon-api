module Muffon
  module Profile
    class Finder < Muffon::Base
      PARAMS = %i[
        email
        nickname
        gender
        birthdate
        country
        city
      ].freeze

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
        profile.slice(*PARAMS).merge(
          avatar_data
        )
      end

      def avatar_data
        { avatar: profile.avatar.url }
      end
    end
  end
end
