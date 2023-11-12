module Muffon
  class Profiles
    class Profile < Muffon::Profile::Base
      def call
        data
      end

      private

      def data
        profile_base_data
          .merge(profile_personal_data)
          .merge(profile_extra_data)
          .merge(profile_other_profile_data)
          .merge(profile_relationships_data)
      end

      def profile
        @args[:profile]
      end

      def profile_base_data
        {
          id: profile.id,
          nickname:,
          role:,
          private: profile.private
        }.compact
      end

      def role
        return if profile.role == 'profile'

        profile.role
      end

      def profile_personal_data
        {
          image: profile.image_data,
          gender: profile.gender,
          birthdate: profile.birthdate,
          country: profile.country,
          city: profile.city,
          status: profile.status
        }.compact_blank
      end

      def profile_extra_data
        {
          created: created_formatted,
          online: profile.online,
          playing: profile.playing
        }.compact
      end

      def created_formatted
        datetime_formatted(
          profile.created_at
        )
      end

      def profile_other_profile_data
        return {} unless valid_other_profile?

        { other_profile: other_profile_data }
      end

      def other_profile_data
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

      def profile_relationships_data
        {
          followers_count:
            profile.followers_count,
          following_count:
            profile.following_count
        }
      end
    end
  end
end
