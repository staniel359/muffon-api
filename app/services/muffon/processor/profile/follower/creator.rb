module Muffon
  module Processor
    module Profile
      module Follower
        class Creator < Muffon::Processor::Profile::Follower::Base
          private

          def process_relationship
            relationship

            { other_profile: other_profile_data }
          end

          def relationship
            @relationship ||=
              profile
              .active_relationships
              .where(
                other_profile_id:
                  @args[:other_profile_id]
              )
              .first_or_create!
          end
        end
      end
    end
  end
end
