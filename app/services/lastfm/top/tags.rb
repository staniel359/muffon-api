module LastFM
  module Top
    class Tags < LastFM::Top::Base
      API_METHOD = 'chart.getTopTags'.freeze
      COLLECTION_NAME = 'tags'.freeze
      MODEL_NAME = 'tag'.freeze
      TOTAL_ITEMS_COUNT = 1_000
      include LastFM::Utils::Pagination

      private

      def total_items_count
        TOTAL_ITEMS_COUNT
      end

      def total_limit
        TOTAL_ITEMS_COUNT
      end

      def collection_list
        collection_paginated(super)
      end

      def collection_item_data_formatted(tag)
        {
          name: tag['name'],
          taggers_count: tag['reach'].to_i
        }
      end
    end
  end
end
