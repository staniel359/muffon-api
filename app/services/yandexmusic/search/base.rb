module YandexMusic
  module Search
    class Base < YandexMusic::Base
      include Muffon::Utils::Pagination

      private

      def primary_args
        [@args.query]
      end

      def no_data?
        collection_list.blank?
      end

      def collection_list
        @collection_list ||= response_data.dig(
          collection_name, 'items'
        )
      end

      def collection_name
        self.class::COLLECTION_NAME
      end

      def link
        "#{BASE_LINK}/music-search.jsx"
      end

      def params
        super.merge(search_params)
      end

      def search_params
        {
          text: @args.query,
          type: collection_name,
          page: page - 1
        }
      end

      def data
        { search: paginated_data }
      end

      def total_items_count
        response_data.dig(
          'pager', 'total'
        )
      end

      def limit
        response_data.dig(
          'pager', 'perPage'
        )
      end
    end
  end
end
