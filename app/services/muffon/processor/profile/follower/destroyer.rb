module Muffon
  module Processor
    module Profile
      module Follower
        class Destroyer < Muffon::Processor::Profile::Follower::Base
          private

          def process_relationship
            relationship&.destroy

            {
              other_profile_follower_profiles_count:
                other_profile.follower_profiles_count
            }
          end

          def relationship
            @relationship ||=
              profile.active_relationships.find_by(
                other_profile_id:
                  @args[:other_profile_id]
              )
          end
        end
      end
    end
  end
end
