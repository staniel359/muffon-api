module API
  module Muffon
    class PasswordsController < API::BaseController
      def reset; end

      def update; end

      private

      def reset_data
        ::Muffon::Profile::Password::Resetter.call(
          params.slice(
            *%i[email language]
          )
        )
      end

      def update_data
        ::Muffon::Processor::Profile::Password::Updater.call(
          params.slice(
            *%i[email code password password_confirmation]
          )
        )
      end
    end
  end
end
