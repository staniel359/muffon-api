module Muffon
  module Profile
    class Info
      class Extra < Muffon::Profile::Info
        def call
          data
        end

        private

        def data
          {
            created: created_formatted,
            playing:,
            online: online?,
            was_online: was_online_formatted,
            other_profile: other_profile_data,
            followers_count:,
            following_count:,
            library: library_data
          }.compact
        end

        def created_formatted
          datetime_formatted(
            profile.created_at
          )
        end

        def playing
          profile.playing
        end

        def online?
          profile.online
        end

        def was_online_formatted
          return if online?

          datetime_formatted(
            was_online
          )
        end

        def was_online
          profile.was_online_at ||
            profile.updated_at
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
            @args[:other_profile_id]
          )
        end

        def followed_by_profile?
          profile.in_following?(
            @args[:other_profile_id]
          )
        end

        def followers_count
          profile.followers_count
        end

        def following_count
          profile.following_count
        end

        def library_data
          Muffon::Profile::Library::Info.call(
            profile_id: @args[:profile_id],
            token: @args[:token],
            other_profile_id: @args[:other_profile_id]
          ).dig(
            :profile, :library
          )
        end
      end
    end
  end
end
