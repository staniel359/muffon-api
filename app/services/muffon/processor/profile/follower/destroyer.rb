module Muffon
  module Processor
    module Profile
      module Follower
        class Destroyer < Muffon::Processor::Profile::Follower::Base
          private

          def process_relationship
            relationship&.destroy

            { other_profile: other_profile_data }
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
