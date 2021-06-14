module RateYourMusic
  module Search
    class AlbumsVarious < RateYourMusic::Search::Base
      COLLECTION_NAME = 'albums'.freeze
      SEARCH_TYPE = 'y'.freeze

      private

      def collection_item_data_formatted(album)
        RateYourMusic::Search::AlbumsVarious::Album.call(
          album: album
        )
      end
    end
  end
end
