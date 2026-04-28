module Muffon
  module Processor
    module Profile
      module Password
        class Updater < Muffon::Processor::Profile::Base
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

          def data
            profile_record.update(
              password: @args[:password],
              password_confirmation: @args[:password_confirmation]
            )

            add_wrong_password_reset_code_error unless correct_reset_code?

            if profile_record.errors?
              profile_record.errors_data
            else
              profile_record.update!(
                password_reset_code: nil
              )

              { success: true }
            end
          end

          def profile_record
            @profile_record ||=
              ::Profile.with_email(
                @args[:email]
              )
          end

          def correct_reset_code?
            profile_record.password_reset_code == @args[:code].to_i
          end

          def add_wrong_password_reset_code_error
            profile_record
              .errors
              .add(
                :password_reset_code,
                'wrong'
              )
          end
        end
      end
    end
  end
end
