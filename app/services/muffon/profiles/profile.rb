module Muffon
  class Profiles
    class Profile < Muffon::Profile::Base
      def call
        data
      end

      private

      def data
        profile_base_data
          .merge(profile_extra_data)
          .merge(profile_other_profile_data)
          .merge(profile_relationships_data)
          .merge(profile_lastfm_data)
      end

      def profile_base_data
        {
          id: profile.id,
          nickname: nickname,
          email: email
        }.compact
      end

      def profile
        @args[:profile]
      end

      def email
        return if wrong_profile?

        profile.email
      end

      def profile_extra_data
        {
          image: profile.image_data,
          gender: profile.gender,
          birthdate: profile.birthdate,
          country: country,
          city: city,
          role: role,
          online: profile.online
        }.compact
      end

      def country
        profile
          .country
          .presence
      end

      def city
        profile
          .city
          .presence
      end

      def role
        return if profile.role == 'profile'

        profile.role
      end

      def profile_other_profile_data
        return {} if @args[:other_profile_id].blank?

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
        profile.follower_profiles.find_by(
          id: @args[:other_profile_id]
        ).present?
      end

      def followed_by_profile?
        profile.following_profiles.find_by(
          id: @args[:other_profile_id]
        ).present?
      end

      def profile_relationships_data
        {
          follower_profiles_count:
            profile.follower_profiles_count,
          following_profiles_count:
            profile.following_profiles_count
        }
      end

      def profile_lastfm_data
        return {} if wrong_profile?

        {
          lastfm_nickname:
            profile.lastfm_nickname,
          lastfm_session_key:
            profile.lastfm_session_key
        }.compact
      end
    end
  end
end
