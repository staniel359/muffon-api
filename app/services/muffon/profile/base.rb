module Muffon
  module Profile
    class Base < Muffon::Base
      PARAMS = %i[
        email
        password
        password_confirmation
        nickname
        image
        gender
        birthdate
        country
        city
      ].freeze

      private

      def primary_args
        [@args[:profile_id]]
      end

      def no_data?
        profile.blank?
      end

      def wrong_profile?
        profile.token != @args[:token]
      end

      def profile_params
        PARAMS.reject do |p|
          %i[image].include?(p)
        end
      end

      def errors?
        profile.errors.any?
      end

      def errors_data
        forbidden.merge(
          { errors: errors }
        )
      end

      def errors
        profile.errors_formatted
      end

      def process_image
        profile.process_image(
          @args[:image]
        )
      end

      def data
        { profile: profile_data }
      end

      def nickname
        profile.nickname
      end
    end
  end
end
