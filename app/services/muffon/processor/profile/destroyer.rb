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
          !valid_profile? ||
            !authenticated?
        end

        def authenticated?
          !!profile.authenticate(
            @args[:password]
          )
        end

        def data
          profile.destroy

          { success: true }
        end
      end
    end
  end
end
