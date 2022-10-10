module LastFM
  module Search
    class Base < LastFM::Kerve::Base
      include Muffon::Utils::Pagination

      private

      def primary_args
        [@args[:query]]
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
        search_params
          .merge(pagination_params)
      end

      def search_params
        {
          q: @args[:query],
          type: model_name
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
          "total#{collection_name.capitalize}"
        ).to_i
      end

      def collection_list
        results_list_filtered.last(limit)
      end

      def results_list_filtered
        results_list.reject do |r|
          r['name'] == '(null)'
        end
      end

      alias link search_link
    end
  end
end
