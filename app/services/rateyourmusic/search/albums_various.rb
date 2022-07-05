module RateYourMusic
  module Search
    class AlbumsVarious < RateYourMusic::Search::Base
      COLLECTION_NAME = 'albums_various'.freeze
      SEARCH_TYPE = 'y'.freeze
      TOTAL_LIMIT = 200

      private

      def collection_item_data_formatted(album)
        RateYourMusic::Search::AlbumsVarious::Album.call(
          album:
        )
      end
    end
  end
end
