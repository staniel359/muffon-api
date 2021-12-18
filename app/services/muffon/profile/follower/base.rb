module Muffon
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

        def errors?
          relationship&.errors&.any?
        end

        def errors
          relationship&.errors_formatted
        end

        def other_profile_follower_profiles_count
          other_profile.follower_profiles_count
        end

        def other_profile
          ::Profile.find_by(
            id: @args[:other_profile_id]
          )
        end
      end
    end
  end
end
