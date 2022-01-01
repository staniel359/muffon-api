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
        @collection_list ||=
          response_data.dig(
            'results', 'data'
          )
      end

      def payload
        {
          filter: 'all',
          nb: limit,
          output:,
          query: @args[:query],
          start: offset
        }.to_json
      end

      def output
        self.class::MODEL_NAME.upcase
      end

      def data
        { search: paginated_data }
      end

      def total_items_count
        response_data.dig(
          'results', 'total'
        )
      end
    end
  end
end
