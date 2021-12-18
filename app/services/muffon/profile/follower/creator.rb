module Muffon
  module Profile
    module Follower
      class Creator < Muffon::Profile::Follower::Base
        private

        def data
          return forbidden if wrong_profile?

          relationship

          return errors_data if errors?

          {
            other_profile_follower_profiles_count:
              other_profile_follower_profiles_count
          }
        end

        def relationship
          @relationship ||=
            profile.active_relationships.where(
              other_profile_id: @args[:other_profile_id]
            ).first_or_create
        end
      end
    end
  end
end
