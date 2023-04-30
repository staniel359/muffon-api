module API
  module Spotify
    class TracksController < API::BaseController
      def info; end

      def links; end

      private

      def info_data
        ::Spotify::Track::Info.call(
          params.slice(
            *%i[track_id profile_id token]
          )
        )
      end

      def links_data
        ::Spotify::Track::Links.call(
          params.slice(
            *%i[track_id]
          )
        )
      end
    end
  end
end
