module Muffon
  module Profile
    class Info < Muffon::Profile::Base
      private

      def profile_data
        profile_base_data
          .merge(profile_extra_data)
          .merge(profile_online_data)
          .merge(profile_other_profile_data)
          .merge(profile_relationships_data)
          .merge(profile_lastfm_data)
      end

      def profile_base_data
        {
          id: profile.id,
          nickname:,
          email:,
          role:,
          private: profile.private
        }.compact
      end

      def profile
        @profile ||=
          ::Profile
          .associated
          .find_by(
            id: @args[:profile_id]
          )
      end

      def email
        return if wrong_profile?

        profile.email
      end

      def role
        return if profile.role == 'profile'

        profile.role
      end

      def profile_extra_data
        {
          image: profile.image_data,
          gender: profile.gender,
          birthdate: profile.birthdate,
          country: profile.country,
          city: profile.city,
          created: created_formatted,
          playing: profile.playing
        }.compact_blank
      end

      def created_formatted
        datetime_formatted(
          profile.created_at
        )
      end

      def profile_online_data
        {
          online: profile.online,
          was_online: was_online_formatted
        }.compact
      end

      def was_online_formatted
        return if profile.online

        datetime_formatted(
          was_online
        )
      end

      def was_online
        profile.online_updated_at ||
          profile.updated_at
      end

      def profile_other_profile_data
        return {} if @args[:other_profile_id].blank?

        { other_profile: other_profile_data }
      end

      def other_profile_data
        {
          follower_of_profile: follower_of_profile?,
          followed_by_profile: followed_by_profile?
        }
      end

      def follower_of_profile?
        profile.follower_of_profile?(
          @args[:other_profile_id]
        )
      end

      def followed_by_profile?
        profile.followed_by_profile?(
          @args[:other_profile_id]
        )
      end

      def profile_relationships_data
        {
          followers_count: profile.followers_count,
          following_count: profile.following_count
        }
      end

      def profile_lastfm_data
        return {} if wrong_profile?

        {
          lastfm_nickname: profile.lastfm_nickname,
          lastfm_session_key: profile.lastfm_session_key
        }
      end
    end
  end
end
