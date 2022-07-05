module RateYourMusic
  module Search
    class Albums < RateYourMusic::Search::Base
      COLLECTION_NAME = 'albums'.freeze
      SEARCH_TYPE = 'l'.freeze
      TOTAL_LIMIT = 200

      private

      def collection_item_data_formatted(album)
        RateYourMusic::Search::Albums::Album.call(
          album:
        )
      end
    end
  end
end
