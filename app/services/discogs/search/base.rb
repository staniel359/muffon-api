module Discogs
  module Search
    class Base < Discogs::Base
      MAXIMUM_ITEMS_COUNT = 10_000

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

      def data
        { search: search_data }
      end

      def raw_collection
        response_data['results']
      end

      def link
        "#{BASE_LINK}/database/search"
      end

      def params
        {
          **super,
          query: @args[:query],
          page:,
          per_page: limit
        }
      end

      def items_count
        response_data.dig(
          'pagination',
          'items'
        )
      end
    end
  end
end
