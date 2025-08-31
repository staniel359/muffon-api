module Odnoklassniki
  module Search
    class Base < Odnoklassniki::Base
      TOTAL_LIMIT = 10_000

      include Muffon::Utils::Pagination

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

      def collection_list
        response_data[collection_name] || []
      end

      def params
        {
          **super,
          q: @args[:query],
          start: offset,
          count: limit
        }
      end

      def data
        { search: paginated_data }
      end

      def collection_count
        response_data.dig(
          'relevantCounts',
          collection_name
        ) || 0
      end

      def albums
        @albums ||=
          response_data['albums']
      end
    end
  end
end
