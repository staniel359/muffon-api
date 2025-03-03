module Muffon
  module Profile
    class Info < Muffon::Profile::Base
      private

      def profile_data
        {
          **profile_base_data,
          **profile_personal_data,
          **profile_relationships_data,
          **profile_extra_data,
          **profile_connections_data
        }
      end

      def profile_base_data
        {
          id: profile.id,
          nickname:,
          email:,
          role: profile.role,
          private: profile.private
        }.compact
      end

      def profile
        @profile ||=
          ::Profile
          .associated
          .find_by(
            id: profile_id
          )
      end

      def profile_id
        @args[:profile_id]
      end

      def email
        return unless valid_profile?

        profile.email
      end

      def profile_personal_data
        Muffon::Profile::Info::Personal.call(
          profile_id:,
          token:
        )
      end

      def token
        @args[:token]
      end

      def profile_relationships_data
        Muffon::Profile::Info::Relationships.call(
          profile_id:,
          token:,
          other_profile_id:
        )
      end

      def other_profile_id
        @args[:other_profile_id]
      end

      def profile_extra_data
        Muffon::Profile::Info::Extra.call(
          profile_id:,
          token:,
          other_profile_id:
        )
      end

      def profile_connections_data
        Muffon::Profile::Info::Connections.call(
          profile_id:,
          token:
        )
      end
    end
  end
end
