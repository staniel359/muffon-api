module Muffon
  module Profile
    module Follower
      class Destroyer < Muffon::Profile::Follower::Base
        private

        def data
          return forbidden if wrong_profile?

          relationship&.destroy

          return errors_data if errors?

          {
            other_profile_follower_profiles_count:
              other_profile_follower_profiles_count
          }
        end

        def relationship
          @relationship ||=
            profile.active_relationships.find_by(
              other_profile_id: @args[:other_profile_id]
            )
        end
      end
    end
  end
end
