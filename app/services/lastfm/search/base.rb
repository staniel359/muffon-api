module LastFM
  module Search
    class Base < LastFM::Base
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

      def maximum_items_count
        pagination_maximum_items_count_data[:search]
      end
    end
  end
end
