module API
  module SoundCloud
    class SearchController < API::BaseController
      def artists; end

      def albums; end

      def tracks; end

      private

      def artists_data
        ::SoundCloud::Search::Artists.call(
          params.slice(
            *%i[query profile_id token page limit]
          )
        )
      end

      def albums_data
        ::SoundCloud::Search::Albums.call(
          params.slice(
            *%i[query profile_id token page limit]
          )
        )
      end

      def tracks_data
        ::SoundCloud::Search::Tracks.call(
          params.slice(
            *%i[query profile_id token page limit]
          )
        )
      end
    end
  end
end
