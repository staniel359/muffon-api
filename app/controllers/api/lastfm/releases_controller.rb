module API
  module LastFM
    class ReleasesController < API::BaseController
      def new; end

      def upcoming; end

      private

      def new_data
        ::LastFM::Releases::New.call(
          params.slice(
            *%i[
              profile_id
              token
              page
            ]
          )
        )
      end

      def upcoming_data
        ::LastFM::Releases::Upcoming.call(
          params.slice(
            *%i[
              profile_id
              token
              page
            ]
          )
        )
      end
    end
  end
end
