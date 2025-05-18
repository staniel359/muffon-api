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
          check_password

          return profile.errors_data if profile.errors?

          profile.run_callbacks(
            :destroy
          )

          { success: true }
        end
      end
    end
  end
end
