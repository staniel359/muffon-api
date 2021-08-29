module Muffon
  class Profiles
    class Profile < Muffon::Profiles
      def call
        data
      end

      private

      def data
        {
          id: id,
          nickname: nickname,
          image: image_data,
          gender: gender,
          birthdate: birthdate,
          country: country,
          city: city,
          role: role
        }
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
