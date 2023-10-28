module Muffon
  module Profile
    module Password
      class Resetter < Muffon::Profile::Base
        private

        def primary_args
          [@args[:email]]
        end

        def forbidden?
          false
        end

        def profile
          @profile ||=
            ::Profile.with_email(
              @args[:email]
            )
        end

        def data
          profile.update(
            password_reset_code:
          )

          send_password_reset_code_email

          { success: true }
        end

        def password_reset_code
          (
            SecureRandom.random_number(9e5) + 1e5
          ).to_i
        end

        def send_password_reset_code_email
          mailer
            .password_reset_email
            .deliver_later
        end

        def mailer
          ProfileMailer.with(
            email: profile.email,
            code: profile.password_reset_code,
            language:
          )
        end
      end
    end
  end
end
