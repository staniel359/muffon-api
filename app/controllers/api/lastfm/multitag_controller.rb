module API
  module LastFM
    class MultitagController < API::BaseController
      def artists; end

      def albums; end

      private

      def artists_data
        ::LastFM::Multitag::Artists.call(
          params.slice(
            *%i[
              tags
              profile_id
              token
              page
              limit
            ]
          )
        )
      end

      def albums_data
        ::LastFM::Multitag::Albums.call(
          params.slice(
            *%i[
              tags
              profile_id
              token
              page
              limit
            ]
          )
        )
      end
    end
  end
end
