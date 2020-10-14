module LastFM
  module Search
    class Base < LastFM::API
      private

      def service_info
        {
          api_method: "#{model_name}.search",
          response_data_node: 'results'
        }
      end

      def primary_args
        [@args.query]
      end

      def no_data?
        super || results.blank?
      end

      def results
        @results ||= response_data.dig(
          "#{model_name}matches", model_name
        )
      end

      def data
        { search: search_data }
      end

      def search_data
        {
          query: @args.query,
          page: page,
          model_name.pluralize.to_sym => results_data
        }
      end

      def page
        response_data.dig(
          'opensearch:Query', 'startPage'
        ).to_i
      end
    end
  end
end
