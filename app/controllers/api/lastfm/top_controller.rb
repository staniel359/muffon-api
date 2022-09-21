module API
  module LastFM
    class TopController < API::BaseController
      def artists; end

      def albums; end

      def tracks; end

      def tags; end

      private

      def artists_data
        ::LastFM::Top::Artists.call(
          params.slice(
            *%i[profile_id country page limit]
          )
        )
      end

      def albums_data
        ::LastFM::Top::Albums.call(
          params.slice(
            *%i[profile_id country page limit]
          )
        )
      end

      def tracks_data
        ::LastFM::Top::Tracks.call(
          params.slice(
            *%i[profile_id country page limit]
          )
        )
      end

      def tags_data
        ::LastFM::Top::Tags.call(
          params.slice(
            *%i[profile_id country page limit]
          )
        )
      end
    end
  end
end
