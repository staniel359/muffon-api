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
          .merge(profile_lastfm_data)
      end

      def profile_base_data
        {
          id: id,
          nickname: nickname,
          email: email
        }.compact
      end

      def id
        profile.id
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
          image: image_data,
          gender: gender,
          birthdate: birthdate,
          country: country,
          city: city,
          role: role
        }.compact
      end

      def image_data
        profile.image_data
      end

      def gender
        profile.gender
      end

      def birthdate
        profile.birthdate
      end

      def country
        profile.country.presence
      end

      def city
        profile.city.presence
      end

      def role
        profile.role
      end

      def profile_lastfm_data
        return {} if wrong_profile?

        {
          lastfm_nickname: lastfm_nickname,
          lastfm_session_key: lastfm_session_key
        }.compact
      end

      def lastfm_nickname
        profile.lastfm_nickname
      end

      def lastfm_session_key
        profile.lastfm_session_key
      end
    end
  end
end
