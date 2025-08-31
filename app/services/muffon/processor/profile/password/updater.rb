module Muffon
  module Processor
    module Profile
      module Password
        class Updater < Muffon::Processor::Profile::Password::Base
          private

          def required_args
            %i[
              email
              code
              password
              password_confirmation
            ]
          end

          def forbidden?
            false
          end

          def process_profile
            profile.update(
              password: @args[:password],
              password_confirmation:
                @args[:password_confirmation]
            )

            check_password_reset_code

            if profile.errors?
              profile.errors_data
            else
              reset_profile_password_reset_code!

              { success: true }
            end
          end

          def check_password_reset_code
            return if codes_match?

            add_wrong_password_reset_code_error
          end

          def codes_match?
            profile.password_reset_code ==
              @args[:code].to_i
          end

          def add_wrong_password_reset_code_error
            profile
              .errors
              .add(
                :password_reset_code, 'wrong'
              )
          end

          def reset_profile_password_reset_code!
            profile.update!(
              password_reset_code: nil
            )
          end
        end
      end
    end
  end
end
