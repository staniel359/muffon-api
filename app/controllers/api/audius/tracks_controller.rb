module API
  module Audius
    class TracksController < API::BaseController
      def info; end

      def description; end

      def tags; end

      def links; end

      def albums; end

      private

      def info_data
        ::Audius::Track::Info.call(
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
        ::Audius::Track::Description.call(
          params.slice(
            *%i[
              track_id
            ]
          )
        )
      end

      def tags_data
        ::Audius::Track::Tags.call(
          params.slice(
            *%i[
              track_id
            ]
          )
        )
      end

      def links_data
        ::Audius::Track::Links.call(
          params.slice(
            *%i[
              track_id
            ]
          )
        )
      end

      def albums_data
        ::Audius::Track::Albums.call(
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
