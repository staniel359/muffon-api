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
        [@args.profile_id]
      end

      def no_data?
        profile.blank?
      end

      def profile
        @profile ||= ::Profile.find_by(
          id: @args.profile_id
        )
      end

      def wrong_profile?
        profile.token != @args.token
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
        return if @args.image.blank?

        remove_image

        add_image if @args.image != 'DELETED'
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
        {
          io: image_io,
          filename: image_filename,
          content_type: image_content_type
        }
      end

      def image_io
        StringIO.new(image_base64)
      end

      def image_base64
        Base64.decode64(
          @args.image.split(',')[1]
        )
      end

      def image_filename
        "image.#{image_extension}"
      end

      def image_extension
        @args.image.split(',')[0].match(
          %r{image/(.+);}
        )[1]
      end

      def image_content_type
        "image/#{image_extension}"
      end
    end
  end
end
