module API
  module LastFM
    class UsersController < API::BaseController
      def info; end

      def plays; end

      private

      def info_data
        ::LastFM::User::Info.call(
          params.slice(
            *%i[profile_id token nickname counter]
          )
        )
      end

      def plays_data
        ::LastFM::User::Plays.call(
          params.slice(
            *%i[profile_id token nickname page limit]
          )
        )
      end
    end
  end
end
