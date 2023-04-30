module API
  module MusicBrainz
    class TracksController < API::BaseController
      def info; end

      def tags; end

      def links; end

      private

      def info_data
        ::MusicBrainz::Track::Info.call(
          params.slice(
            *%i[track_id profile_id token]
          )
        )
      end

      def tags_data
        ::MusicBrainz::Track::Tags.call(
          params.slice(
            *%i[track_id]
          )
        )
      end

      def links_data
        ::MusicBrainz::Track::Links.call(
          params.slice(
            *%i[track_id]
          )
        )
      end
    end
  end
end
