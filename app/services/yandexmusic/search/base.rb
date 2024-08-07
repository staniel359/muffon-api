module YandexMusic
  module Search
    class Base < YandexMusic::Base
      TOTAL_LIMIT = 10_000

      include Muffon::Utils::Pagination

      private

      def primary_args
        [@args[:query]]
      end

      def collection_list
        collection_data['items'] || []
      end

      def collection_data
        response_data[collection_name] || {}
      end

      def collection_name
        self.class::COLLECTION_NAME
      end

      def link
        "#{BASE_LINK}/music-search.jsx"
      end

      def params
        super.merge(
          search_params
        )
      end

      def search_params
        {
          text: @args[:query],
          type: collection_type,
          page: page - 1
        }
      end

      def collection_type
        self.class::COLLECTION_TYPE
      end

      def data
        { search: paginated_data }
      end

      def collection_count
        collection_data['total'] || 0
      end

      def limit
        collection_data['perPage']
      end
    end
  end
end
