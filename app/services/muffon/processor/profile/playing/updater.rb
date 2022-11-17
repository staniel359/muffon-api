module Muffon
  module Processor
    module Profile
      module Playing
        class Updater < Muffon::Profile::Base
          private

          def primary_args
            [
              @args[:profile_id],
              @args[:token]
            ]
          end

          def no_data?
            profile.blank?
          end

          def forbidden?
            !valid_profile?
          end

          def profile_data
            process_profile

            { success: true }
          end

          def process_profile
            profile.update(
              playing: @args[:playing]
            )
          end
        end
      end
    end
  end
end
