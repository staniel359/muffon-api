module API
  module SoundCloud
    class TracksController < API::BaseController
      def info; end

      def links; end

      private

      def info_data
        ::SoundCloud::Track::Info.call(
          params.slice(
            *%i[track_id profile_id token]
          )
        )
      end

      def links_data
        ::SoundCloud::Track::Links.call(
          params.slice(
            *%i[track_id]
          )
        )
      end
    end
  end
end
