module AmazonMusic
  module Search
    class Base < AmazonMusic::Base
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
        response_data.dig(
          'data',
          'specificationSearch',
          'result',
          0,
          'edges'
        )
      end

      def next_page
        response_data.dig(
          'data',
          'specificationSearch',
          'result',
          0,
          'pageInfo',
          'token'
        )
      end
    end
  end
end
