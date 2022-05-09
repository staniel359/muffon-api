module LastFM
  module Top
    class Base < LastFM::Kerve::Base
      include Muffon::Utils::Pagination

      private

      def link
        charts_link
      end

      def params
        {
          type: model_name,
          nr: total_limit
        }
      end

      def model_name
        self.class::MODEL_NAME
      end

      def total_limit
        self.class::TOTAL_LIMIT
      end

      def data
        { top: paginated_data }
      end

      def total_items_count
        raw_collection_list.size
      end

      def raw_collection_list
        response_data.dig(
          'results', model_name
        )
      end

      def collection_list
        collection_paginated(
          raw_collection_list
        )
      end
    end
  end
end
