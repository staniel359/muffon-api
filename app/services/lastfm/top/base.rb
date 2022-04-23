module LastFM
  module Top
    class Base < LastFM::Base
      TOTAL_ITEMS_COUNT = 10_000
      include Muffon::Utils::Pagination

      private

      def primary_args
        []
      end

      def params
        super.merge(
          pagination_params
        )
      end

      def data
        { top: paginated_data }
      end

      def total_items_count
        TOTAL_ITEMS_COUNT
      end

      def collection_list
        response_data.dig(
          collection_name, model_name
        )
      end

      def model_name
        self.class::MODEL_NAME
      end
    end
  end
end
