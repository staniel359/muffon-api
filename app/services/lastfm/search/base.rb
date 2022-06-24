module LastFM
  module Search
    class Base < LastFM::Base
      include Muffon::Utils::Pagination

      private

      def primary_args
        [@args[:query]]
      end

      def no_data?
        results_list.blank?
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
        super
          .merge(search_params)
          .merge(pagination_params)
      end

      def search_params
        { model_name.to_sym => @args[:query] }
      end

      def data
        { search: paginated_data }
      end

      def total_items_count
        response_data.dig(
          'results',
          'opensearch:totalResults'
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
    end
  end
end
