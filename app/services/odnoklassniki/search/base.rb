module Odnoklassniki
  module Search
    class Base < Odnoklassniki::Base
      TOTAL_LIMIT = 10_000

      include Muffon::Utils::Pagination

      private

      def primary_args
        [@args[:query]]
      end

      def collection_list
        response_data[
          collection_name
        ] || []
      end

      def params
        super.merge(
          search_params
        )
      end

      def search_params
        {
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
