module Muffon
  module Profile
    class Info < Muffon::Profile::Base
      private

      def profile_data
        profile_base_data
          .merge(profile_personal_data)
          .merge(profile_extra_data)
          .merge(profile_connections_data)
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
        return unless valid_profile?

        profile.email
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
        Muffon::Profile::Info::Extra.call(
          profile_id: @args[:profile_id],
          other_profile_id:
            @args[:other_profile_id]
        )
      end

      def profile_connections_data
        Muffon::Profile::Info::Connections.call(
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
