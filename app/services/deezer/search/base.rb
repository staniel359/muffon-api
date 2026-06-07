module Deezer
  module Search
    class Base < Deezer::Base
      API_METHOD = 'search.music'.freeze

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

      def raw_collection
        response_data.dig(
          'results',
          'data'
        ) || []
      end

      def request_payload
        {
          filter: 'all',
          nb: limit,
          query: @args[:query],
          start: offset
        }
      end

      def data
        { search: search_data }
      end

      def items_count
        response_data.dig(
          'results',
          'total'
        ) || 0
      end

      def maximum_items_count
        pagination_maximum_items_count_data[:search]
      end
    end
  end
end
