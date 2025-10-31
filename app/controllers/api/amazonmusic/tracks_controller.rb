module API
  module AmazonMusic
    class TracksController < API::BaseController
      def info; end

      def links; end

      def albums; end

      private

      def info_data
        ::AmazonMusic::Track::Info.call(
          params.slice(
            *%i[
              album_id
              track_id
              profile_id
              token
              with_audio
            ]
          )
        )
      end

      def links_data
        ::AmazonMusic::Track::Links.call(
          params.slice(
            *%i[
              album_id
              track_id
            ]
          )
        )
      end

      def albums_data
        ::AmazonMusic::Track::Albums.call(
          params.slice(
            *%i[
              album_id
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
