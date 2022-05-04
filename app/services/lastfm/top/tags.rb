module LastFM
  module Top
    class Tags < LastFM::Top::Base
      COLLECTION_NAME = 'tags'.freeze
      MODEL_NAME = 'tag'.freeze
      TOTAL_LIMIT = 1_000

      private

      def collection_item_data_formatted(tag)
        { name: tag['name'] }
      end
    end
  end
end
