module Muffon
  module Processor
    module Profile
      module Follower
        class Creator < Muffon::Processor::Profile::Follower::Base
          private

          def data
            profile_record.follow!(
              other_profile_id: @args[:other_profile_id]
            )

            { other_profile: other_profile_data }
          end
        end
      end
    end
  end
end
