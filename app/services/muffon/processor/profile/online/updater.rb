module Muffon
  module Processor
    module Profile
      module Online
        class Updater < Muffon::Profile::Base
          private

          def primary_args
            [
              @args[:profile_id],
              @args[:token],
              @args[:online]
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
            profile.online = @args[:online]

            if offline?
              profile.was_online_at =
                current_time
            end

            profile.save
          end

          def offline?
            @args[:online].zero?
          end
        end
      end
    end
  end
end
