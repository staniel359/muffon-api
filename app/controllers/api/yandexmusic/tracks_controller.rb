module API
  module YandexMusic
    class TracksController < API::BaseController
      def info; end

      private

      def info_data
        ::YandexMusic::Track::Info.call(
          params.slice(
            *%i[track_id profile_id language]
          )
        )
      end
    end
  end
end
