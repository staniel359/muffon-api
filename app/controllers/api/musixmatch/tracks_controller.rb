module API
  module MusixMatch
    class TracksController < API::BaseController
      def info; end

      def tags; end

      def lyrics; end

      def links; end

      def albums; end

      private

      def info_data
        ::MusixMatch::Track::Info.call(
          params.slice(
            *%i[track_id profile_id token]
          )
        )
      end

      def tags_data
        ::MusixMatch::Track::Tags.call(
          params.slice(
            *%i[track_id]
          )
        )
      end

      def lyrics_data
        ::MusixMatch::Track::Lyrics.call(
          params.slice(
            *%i[track_id]
          )
        )
      end

      def links_data
        ::MusixMatch::Track::Links.call(
          params.slice(
            *%i[track_id]
          )
        )
      end

      def albums_data
        ::MusixMatch::Track::Albums.call(
          params.slice(
            *%i[track_id profile_id token]
          )
        )
      end
    end
  end
end
