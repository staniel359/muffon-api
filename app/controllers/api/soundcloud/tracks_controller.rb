module API
  module SoundCloud
    class TracksController < API::BaseController
      def info; end

      def description; end

      def links; end

      def albums; end

      private

      def info_data
        ::SoundCloud::Track::Info.call(
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

      def description_data
        ::SoundCloud::Track::Description.call(
          params.slice(
            *%i[
              track_id
            ]
          )
        )
      end

      def links_data
        ::SoundCloud::Track::Links.call(
          params.slice(
            *%i[
              track_id
            ]
          )
        )
      end

      def albums_data
        ::SoundCloud::Track::Albums.call(
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
