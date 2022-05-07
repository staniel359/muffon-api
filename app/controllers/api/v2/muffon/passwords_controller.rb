module API
  module V2
    module Muffon
      class PasswordsController < API::V2::BaseController
        def reset
          render_data_with_status
        end

        def update
          render_data_with_status
        end

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
end
