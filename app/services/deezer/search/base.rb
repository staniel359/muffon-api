module Deezer
  module Search
    class Base < Deezer::Base
      API_METHOD = 'search.music'.freeze
      TOTAL_LIMIT = 10_000

      include Muffon::Utils::Pagination

      def call
        check_args

        data
      end

      private

      def required_args
        %i[
          query
        ]
      end

      def collection_list
        response_data.dig(
          'results', 'data'
        ) || []
      end

      def payload
        {
          filter: 'all',
          nb: limit,
          output: model_name.upcase,
          query: @args[:query],
          start: offset
        }.to_json
      end

      def model_name
        self.class::MODEL_NAME
      end

      def data
        { search: paginated_data }
      end

      def collection_count
        response_data.dig(
          'results', 'total'
        ) || 0
      end
    end
  end
end
