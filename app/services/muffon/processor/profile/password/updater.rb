module Muffon
  module Processor
    module Profile
      module Password
        class Updater < Muffon::Processor::Profile::Base
          private

          def primary_args
            [
              @args[:email],
              @args[:code],
              @args[:password],
              @args[:password_confirmation]
            ]
          end

          def no_data?
            profile.blank?
          end

          def forbidden?
            false
          end

          def profile
            @profile ||=
              ::Profile.find_by(
                email: @args[:email]
              )
          end

          def data
            process_profile

            check_password_reset_code

            return profile.errors_data if
              profile.errors?

            reset_profile_password_reset_code

            { success: true }
          end

          def process_profile
            profile.update(
              password: @args[:password],
              password_confirmation:
                @args[:password_confirmation]
            )
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

          def reset_profile_password_reset_code
            profile.update(
              password_reset_code: nil
            )
          end
        end
      end
    end
  end
end
