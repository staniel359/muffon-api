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
            wrong_profile?
          end

          def profile_data
            process_profile

            { success: true }
          end

          def process_profile
            profile.tap do |p|
              p.online = @args[:online]

              p.online_updated_at = current_time if offline?

              p.save
            end
          end

          def offline?
            @args[:online].zero?
          end
        end
      end
    end
  end
end
