module Muffon
  module Processor
    module Profile
      module Follower
        class Creator < Muffon::Processor::Profile::Follower::Base
          private

          def process_relationship
            relationship

            return relationship.errors_data if
                relationship.errors?

            { other_profile_follower_profiles_count: }
          end

          def relationship
            @relationship ||=
              profile.active_relationships.where(
                other_profile_id:
                  @args[:other_profile_id]
              ).first_or_create
          end

          def other_profile_follower_profiles_count
            other_profile
              .reload
              .follower_profiles_count
          end
        end
      end
    end
  end
end
