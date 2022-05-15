module API
  module LastFM
    class MultitagController < API::BaseController
      def artists
        render_data_with_status
      end

      private

      def artists_data
        ::LastFM::Multitag::Artists.call(
          params.slice(
            *%i[tags page limit profile_id]
          )
        )
      end
    end
  end
end
