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
        profile.errors.map do |e|
          { e.attribute => e.type }
        end
      end

      def process_image
        return if @args[:image].blank?

        remove_image

        add_image if @args[:image] != 'DELETED'
      end

      def remove_image
        profile.image.purge
      end

      def add_image
        profile.image.attach(
          **image_file_data
        )
      end

      def image_file_data
        Muffon::Utils::Image.call(
          image: @args[:image]
        )
      end

      def data
        { profile: profile_data }
      end
    end
  end
end
