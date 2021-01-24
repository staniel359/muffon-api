module LastFM
  module Top
    class Tags < LastFM::Top::Base
      private

      def model_name
        'tag'
      end

      def collection_name
        'tags'
      end

      def collection_item_data(tag)
        {
          name: tag['name'],
          taggers_count: tag['reach'].to_i
        }
      end
    end
  end
end
