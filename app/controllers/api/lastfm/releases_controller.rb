module API
  module LastFM
    class ReleasesController < API::BaseController
      def new; end

      def upcoming; end

      private

      def new_data
        ::LastFM::Releases::New.call(
          params.slice(
            *%i[page profile_id]
          )
        )
      end

      def upcoming_data
        ::LastFM::Releases::Upcoming.call(
          params.slice(
            *%i[page profile_id]
          )
        )
      end
    end
  end
end
