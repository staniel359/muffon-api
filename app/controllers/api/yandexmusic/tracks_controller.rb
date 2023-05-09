module API
  module YandexMusic
    class TracksController < API::BaseController
      def info; end

      def links; end

      def albums; end

      private

      def info_data
        ::YandexMusic::Track::Info.call(
          params.slice(
            *%i[track_id profile_id token language]
          )
        )
      end

      def links_data
        ::YandexMusic::Track::Links.call(
          params.slice(
            *%i[track_id]
          )
        )
      end

      def albums_data
        ::YandexMusic::Track::Albums.call(
          params.slice(
            *%i[track_id profile_id token]
          )
        )
      end
    end
  end
end
