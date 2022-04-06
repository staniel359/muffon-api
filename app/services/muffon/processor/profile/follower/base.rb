module Muffon
  module Processor
    module Profile
      module Follower
        class Base < Muffon::Profile::Base
          private

          def primary_args
            [
              @args[:profile_id],
              @args[:token],
              @args[:other_profile_id]
            ]
          end

          def no_data?
            super || other_profile.blank?
          end

          def data
            return forbidden if wrong_profile?

            process_relationship
          end
        end
      end
    end
  end
end
