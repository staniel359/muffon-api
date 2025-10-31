module API
  module Odnoklassniki
    class TracksController < API::BaseController
      def info; end

      def links; end

      def albums; end

      private

      def info_data
        ::Odnoklassniki::Track::Info.call(
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
        ::Odnoklassniki::Track::Links.call(
          params.slice(
            *%i[
              track_id
            ]
          )
        )
      end

      def albums_data
        ::Odnoklassniki::Track::Albums.call(
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
