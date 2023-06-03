module Discogs
  module Search
    class Base < Discogs::Base
      TOTAL_LIMIT = 10_000

      include Discogs::Utils::Pagination

      private

      def primary_args
        [@args[:query]]
      end

      def collection_list
        response_data['results']
      end

      def link
        "#{BASE_LINK}/database/search"
      end

      def params
        super.merge(
          search_params
        )
      end

      def search_params
        {
          query: @args[:query],
          type: collection_type
        }
      end

      def collection_type
        self.class::COLLECTION_TYPE
      end

      def data
        { search: paginated_data }
      end

      def collection_count
        response_data.dig(
          'pagination', 'items'
        )
      end
    end
  end
end
