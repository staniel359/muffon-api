module LastFM
  module Search
    class Base < LastFM::Base
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

      def params
        {
          **super,
          page:,
          limit:
        }
      end

      def items_count
        response_data
          .dig(
            'results',
            'opensearch:totalResults'
          )
          .to_i
      end
    end
  end
end
