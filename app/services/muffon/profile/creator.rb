module Muffon
  module Profile
    class Creator < Muffon::Base
      PARAMS = %i[
        email
        password
        password_confirmation
        nickname
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
        @args.to_h.slice(*PARAMS)
      end

      def data
        return errors_data if errors?

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
