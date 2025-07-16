module LastFM
  module Search
    class Base < LastFM::Base
      TOTAL_LIMIT = 10_000

      include Muffon::Utils::Pagination

      private

      def primary_args
        [@args[:query]]
      end

      def api_method
        "#{model_name}.search"
      end

      def results_list
        response_data.dig(
          'results',
          "#{model_name}matches",
          model_name
        )
      end

      def model_name
        self.class::MODEL_NAME
      end

      def params
        {
          **super,
          model_name => @args[:query],
          **pagination_params
        }
      end

      def data
        { search: paginated_data }
      end

      def total_items_count
        [
          collection_count,
          self.class::TOTAL_LIMIT
        ].min
      end

      def collection_count
        response_data.dig(
          'results',
          'opensearch:totalResults'
        ).to_i
      end

      def collection_list
        results_list_filtered.last(limit)
      end

      def results_list_filtered
        results_list.reject do |result|
          result['name'] == '(null)'
        end
      end
    end
  end
end
