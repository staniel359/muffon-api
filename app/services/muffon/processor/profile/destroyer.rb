module Muffon
  module Processor
    module Profile
      class Destroyer < Muffon::Processor::Profile::Base
        private

        def primary_args
          [
            @args[:profile_id],
            @args[:token],
            @args[:password]
          ]
        end

        def forbidden?
          !valid_profile?
        end

        def data
          add_wrong_password_error unless
              authenticated?

          return profile.errors_data if
              profile.errors?

          profile.destroy

          { success: true }
        end

        def authenticated?
          !!profile.authenticate(
            @args[:password]
          )
        end

        def add_wrong_password_error
          profile
            .errors
            .add(
              :password, 'wrong'
            )
        end
      end
    end
  end
end
