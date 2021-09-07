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
        @profile ||= @args.profile
      end

      def nickname
        profile.nickname
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
        }
      end

      def image_data
        profile.image_data
      end

      def gender
        profile.gender || ''
      end

      def birthdate
        profile.birthdate || ''
      end

      def country
        profile.country
      end

      def city
        profile.city
      end

      def role
        profile.role
      end
    end
  end
end
