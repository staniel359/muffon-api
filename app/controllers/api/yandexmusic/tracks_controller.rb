module API
  module YandexMusic
    class TracksController < API::BaseController
      def info; end

      def links; end

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
    end
  end
end
