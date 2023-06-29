module API
  module VK
    class TracksController < API::BaseController
      def info; end

      def links; end

      def albums; end

      private

      def info_data
        ::VK::Track::Info.call(
          params.slice(
            *%i[track_id profile_id token audio_link]
          )
        )
      end

      def links_data
        ::VK::Track::Links.call(
          params.slice(
            *%i[track_id]
          )
        )
      end

      def albums_data
        ::VK::Track::Albums.call(
          params.slice(
            *%i[track_id profile_id token]
          )
        )
      end
    end
  end
end
