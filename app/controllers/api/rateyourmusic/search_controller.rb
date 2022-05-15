module API
  module RateYourMusic
    class SearchController < API::BaseController
      def artists
        render_data_with_status
      end

      def albums
        render_data_with_status
      end

      def albums_various
        render_data_with_status
      end

      def labels
        render_data_with_status
      end

      private

      def artists_data
        ::RateYourMusic::Search::Artists.call(
          params.slice(
            *%i[query profile_id page limit]
          )
        )
      end

      def albums_data
        ::RateYourMusic::Search::Albums.call(
          params.slice(
            *%i[query profile_id page limit]
          )
        )
      end

      def albums_various_data
        ::RateYourMusic::Search::AlbumsVarious.call(
          params.slice(
            *%i[query profile_id page limit]
          )
        )
      end

      def labels_data
        ::RateYourMusic::Search::Labels.call(
          params.slice(
            *%i[query page limit]
          )
        )
      end
    end
  end
end
