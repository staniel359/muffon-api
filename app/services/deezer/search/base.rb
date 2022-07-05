module Deezer
  module Search
    class Base < Deezer::Base
      API_METHOD = 'search.music'.freeze
      include Muffon::Utils::Pagination

      private

      def primary_args
        [@args[:query]]
      end

      def no_data?
        collection_list.blank?
      end

      def collection_list
        response_data.dig(
          'results', 'data'
        )
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
        )
      end
    end
  end
end
