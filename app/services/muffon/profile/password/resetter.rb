module Muffon
  module Profile
    module Password
      class Resetter < Muffon::Profile::Base
        private

        def required_args
          %i[
            email
          ]
        end

        def forbidden?
          false
        end

        def profile_record
          @profile_record ||=
            ::Profile.with_email(
              @args[:email]
            )
        end

        def data
          profile_record.update!(
            password_reset_code:
          )

          send_password_reset_code_email

          { success: true }
        end

        def password_reset_code
          rand(
            100_000..999_999
          )
        end

        def send_password_reset_code_email
          mailer
            .password_reset_email
            .deliver_later
        end

        def mailer
          ProfileMailer.with(
            email: profile_record.email,
            code: profile_record.password_reset_code,
            language:
          )
        end
      end
    end
  end
end
