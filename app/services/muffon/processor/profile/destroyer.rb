module Muffon
  module Processor
    module Profile
      class Destroyer < Muffon::Processor::Profile::Base
        private

        def required_args
          [
            *super,
            :password
          ]
        end

        def data
          check_password

          if profile_record.errors?
            profile_record.errors_data
          else
            profile_record.run_callbacks(
              :destroy
            )

            { success: true }
          end
        end
      end
    end
  end
end
