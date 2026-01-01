module API
  module Spotify
    class TracksController < API::BaseController
      def info; end

      def links; end

      def albums; end

      private

      def info_data
        ::Spotify::Track::Info.call(
          params.slice(
            *%i[
              track_id
              profile_id
              token
              with_audio
            ]
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

      def albums_data
        ::Spotify::Track::Albums.call(
          params.slice(
            *%i[track_id profile_id token]
          )
        )
      end
    end
  end
end
