module API
  module Genius
    class TracksController < API::BaseController
      def info; end

      def description; end

      def tags; end

      def lyrics; end

      private

      def info_data
        ::Genius::Track::Info.call(
          params.slice(
            *%i[track_id profile_id]
          )
        )
      end

      def description_data
        ::Genius::Track::Description.call(
          params.slice(
            *%i[track_id]
          )
        )
      end

      def tags_data
        ::Genius::Track::Tags.call(
          params.slice(
            *%i[track_id]
          )
        )
      end

      def lyrics_data
        ::Genius::Track::Lyrics.call(
          params.slice(
            *%i[track_id]
          )
        )
      end
    end
  end
end
