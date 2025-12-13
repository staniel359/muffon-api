module Odnoklassniki
  module Search
    class Base < Odnoklassniki::Base
      def call
        check_args

        return retry_with_new_session_id if retry_with_new_session_id?

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
          q: @args[:query],
          start: offset,
          count: limit
        }
      end

      def maximum_items_count
        pagination_maximum_items_count_data[:search]
      end
    end
  end
end
