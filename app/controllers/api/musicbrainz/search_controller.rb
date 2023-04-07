module API
  module MusicBrainz
    class SearchController < API::BaseController
      def artists; end

      def albums; end

      def groups; end

      def tracks; end

      def labels; end

      private

      def artists_data
        ::MusicBrainz::Search::Artists.call(
          params.slice(
            *%i[query profile_id token page limit]
          )
        )
      end

      def albums_data
        ::MusicBrainz::Search::Albums.call(
          params.slice(
            *%i[query profile_id token page limit]
          )
        )
      end

      def groups_data
        ::MusicBrainz::Search::Groups.call(
          params.slice(
            *%i[query profile_id token page limit]
          )
        )
      end

      def tracks_data
        ::MusicBrainz::Search::Tracks.call(
          params.slice(
            *%i[query profile_id token page limit]
          )
        )
      end

      def labels_data
        ::MusicBrainz::Search::Labels.call(
          params.slice(
            *%i[query profile_id token page limit]
          )
        )
      end
    end
  end
end
