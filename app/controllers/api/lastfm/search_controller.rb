module API
  module LastFM
    class SearchController < API::BaseController
      def artists; end

      def albums; end

      def tracks; end

      def tags; end

      private

      def artists_data
        ::LastFM::Search::Artists.call(
          params.slice(
            *%i[
              query profile_id
              token page limit
            ]
          )
        )
      end

      def albums_data
        ::LastFM::Search::Albums.call(
          params.slice(
            *%i[
              query profile_id
              token page limit
            ]
          )
        )
      end

      def tracks_data
        ::LastFM::Search::Tracks.call(
          params.slice(
            *%i[
              query profile_id
              token page limit
            ]
          )
        )
      end

      def tags_data
        ::LastFM::Search::Tags.call(
          params.slice(
            *%i[query page limit]
          )
        )
      end
    end
  end
end
