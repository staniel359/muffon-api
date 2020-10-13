module LastFM
  module Search
    class Base < LastFM::API
      private

      def primary_args
        [@args.query]
      end

      def no_data?
        super || results.blank?
      end

      def results
        @results ||= parsed_response.dig(
          "#{model_name}matches", model_name
        )
      end

      def parsed_response
        @parsed_response ||= JSON.parse(
          api_response("#{model_name}.search")
        )['results']
      end

      def data
        { search: search_data }
      end

      def search_data
        {
          query: @args.query,
          results: results_data,
          page: page
        }
      end

      def page
        parsed_response.dig(
          'opensearch:Query', 'startPage'
        ).to_i
      end
    end
  end
end
