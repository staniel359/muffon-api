module API
  module LastFM
    class MultitagController < API::BaseController
      def artists; end

      def albums; end

      def tracks; end

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
              order
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
              order
            ]
          )
        )
      end

      def tracks_data
        ::LastFM::Multitag::Tracks.call(
          params.slice(
            *%i[
              tags
              profile_id
              token
              page
              limit
              order
            ]
          )
        )
      end
    end
  end
end
