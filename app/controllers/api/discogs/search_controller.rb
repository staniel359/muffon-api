module API
  module Discogs
    class SearchController < API::BaseController
      def artists; end

      def labels; end

      def groups; end

      def albums; end

      private

      def artists_data
        ::Discogs::Search::Artists.call(
          params.slice(
            *%i[query profile_id token page limit]
          )
        )
      end

      def labels_data
        ::Discogs::Search::Labels.call(
          params.slice(
            *%i[query page limit]
          )
        )
      end

      def groups_data
        ::Discogs::Search::Groups.call(
          params.slice(
            *%i[query profile_id token page limit]
          )
        )
      end

      def albums_data
        ::Discogs::Search::Albums.call(
          params.slice(
            *%i[query profile_id token page limit]
          )
        )
      end
    end
  end
end
