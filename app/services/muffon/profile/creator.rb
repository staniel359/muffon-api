module Muffon
  module Profile
    class Creator < Muffon::Base
      PARAMS = %i[
        email
        password
        password_confirmation
        nickname
        avatar
        gender
        birthdate
        country
        city
      ].freeze

      private

      def primary_args
        [
          @args.email,
          @args.password,
          @args.password_confirmation,
          @args.nickname
        ]
      end

      def no_data?
        false
      end

      def profile
        @profile ||= ::Profile.create(
          create_params
        )
      end

      def create_params
        @args.to_h.slice(
          *profile_params
        )
      end

      def profile_params
        PARAMS.reject do |p|
          %i[avatar].include?(p)
        end
      end

      def data
        return errors_data if errors?

        add_avatar if @args.avatar.present?

        authenticate
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

      def add_avatar
        profile.avatar.attach(
          avatar_blob
        )
      end

      def avatar_blob
        Muffon::Profile::Avatar.call(
          avatar: @args.avatar
        )
      end

      def authenticate
        Muffon::Profile::Authenticator.call(
          authenticate_params
        )
      end

      def authenticate_params
        profile.slice(
          *Muffon::Profile::Authenticator::PARAMS
        )
      end
    end
  end
end
