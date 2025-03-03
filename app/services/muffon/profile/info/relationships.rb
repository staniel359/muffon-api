module Muffon
  module Profile
    class Info
      class Relationships < Muffon::Profile::Info
        def call
          data
        end

        private

        def data
          {
            other_profile: other_profile_data,
            followers_count:,
            following_count:
          }.compact
        end

        def other_profile_data
          return unless valid_other_profile?

          {
            follower_of_profile:
              follower_of_profile?,
            followed_by_profile:
              followed_by_profile?
          }
        end

        def follower_of_profile?
          profile.in_followers?(
            other_profile_id
          )
        end

        def followed_by_profile?
          profile.in_following?(
            other_profile_id
          )
        end

        def followers_count
          profile.followers_count
        end

        def following_count
          profile.following_count
        end
      end
    end
  end
end
