module API
  module Deezer
    class TracksController < API::BaseController
      def info; end

      private

      def info_data
        ::Deezer::Track::Info.call(
          params.slice(
            *%i[track_id profile_id token]
          )
        )
      end
    end
  end
end
