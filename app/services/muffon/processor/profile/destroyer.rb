module Muffon
  module Processor
    module Profile
      class Destroyer < Muffon::Processor::Profile::Base
        private

        def required_args
          super + %i[
            password
          ]
        end

        def data
          check_password

          if profile.errors?
            profile.errors_data
          else
            profile.run_callbacks(
              :destroy
            )

            { success: true }
          end
        end
      end
    end
  end
end
