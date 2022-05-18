module Muffon
  module Profile
    module Password
      class Resetter < Muffon::Profile::Base
        private

        def primary_args
          [@args[:email]]
        end

        def no_data?
          profile.blank?
        end

        def profile
          @profile ||=
            ::Profile.find_by(
              email: @args[:email]
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
            .deliver_now
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