module API
  module LastFM
    class UsersController < API::BaseController
      def info
        render_data_with_status
      end

      def plays
        render_data_with_status
      end

      private

      def info_data
        ::LastFM::User::Info.call(
          params.slice(:nickname)
        )
      end

      def plays_data
        ::LastFM::User::Plays.call(
          params.slice(
            *%i[nickname page limit]
          )
        )
      end
    end
  end
end
