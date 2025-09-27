module Muffon
  module Processor
    module Profile
      module Library
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

            if profile.has_errors?
              profile.errors_data
            else
              profile.delete_library!

              { success: true }
            end
          end
        end
      end
    end
  end
end
