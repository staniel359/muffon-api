module LastFM
  module User
    class Base < LastFM::Base
      private

      def primary_args
        return primary_skip_profile_args if skip_profile?

        [
          @args[:profile_id],
          @args[:token]
        ]
      end

      def skip_profile?
        test? || !!@args[:skip_profile]
      end

      def primary_skip_profile_args
        [@args[:nickname]]
      end

      def no_data?
        return false if skip_profile?

        profile.blank?
      end

      def forbidden?
        return false if skip_profile?

        !valid_profile?
      end

      def params
        super.merge(
          user_params
        )
      end

      def user_params
        { user: lastfm_nickname }
      end

      def lastfm_nickname
        @args[:nickname] ||
          profile.lastfm_connection&.nickname
      end

      def data
        { user: user_data }
      end
    end
  end
end
