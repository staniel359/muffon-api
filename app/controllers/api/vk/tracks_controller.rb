module API
  module VK
    class TracksController < API::BaseController
      def info; end

      private

      def info_data
        ::VK::Track::Info.call(
          params.slice(
            *%i[track_id profile_id]
          )
        )
      end
    end
  end
end
