module Discogs
  module Search
    class Labels < Discogs::Search::Base
      COLLECTION_NAME = 'labels'.freeze
      COLLECTION_TYPE = 'label'.freeze
      TOTAL_LIMIT = 200

      private

      def collection_item_data_formatted(label)
        Discogs::Search::Labels::Label.call(
          label:
        )
      end
    end
  end
end
