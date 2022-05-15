module API
  module Deezer
    class TracksController < API::BaseController
      def info
        render_data_with_status
      end

      private

      def info_data
        ::Deezer::Track::Info.call(
          params.slice(
            *%i[track_id profile_id]
          )
        )
      end
    end
  end
end
