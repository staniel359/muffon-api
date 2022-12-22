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

            add_code_error if codes_mismatch?

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

          def add_code_error
            profile.errors.add(
              :password_reset_code, 'invalid'
            )
          end

          def codes_mismatch?
            profile.password_reset_code !=
              @args[:code].to_i
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
