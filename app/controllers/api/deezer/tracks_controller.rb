module API
  module Deezer
    class TracksController < API::BaseController
      def info; end

      def links; end

      private

      def info_data
        ::Deezer::Track::Info.call(
          params.slice(
            *%i[track_id profile_id token]
          )
        )
      end

      def links_data
        ::Deezer::Track::Links.call(
          params.slice(
            *%i[track_id]
          )
        )
      end
    end
  end
end
