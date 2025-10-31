module API
  module YouTubeMusic
    class TracksController < API::BaseController
      def info; end

      def links; end

      def albums; end

      private

      def info_data
        ::YouTubeMusic::Track::Info.call(
          params.slice(
            *%i[
              track_id
              with_audio
              profile_id
              token
            ]
          )
        )
      end

      def links_data
        ::YouTubeMusic::Track::Links.call(
          params.slice(
            *%i[
              track_id
            ]
          )
        )
      end

      def albums_data
        ::YouTubeMusic::Track::Albums.call(
          params.slice(
            *%i[
              track_id
              profile_id
              token
            ]
          )
        )
      end
    end
  end
end
