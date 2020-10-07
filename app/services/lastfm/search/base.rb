module LastFM
  module Search
    class Base < LastFM::API
      private

      def primary_args
        [@args.send(model_name)]
      end

      def no_data?
        super || results.blank?
      end

      def results
        @results ||= send("#{model_name}s")
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
          query: query,
          results: results,
          page: page
        }
      end

      def query
        { model_name.to_sym => @args.send(model_name) }
      end

      def page
        parsed_response.dig(
          'opensearch:Query', 'startPage'
        ).to_i
      end
    end
  end
end
