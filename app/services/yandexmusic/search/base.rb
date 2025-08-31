module YandexMusic
  module Search
    class Base < YandexMusic::Base
      TOTAL_LIMIT = 10_000

      include Muffon::Utils::Pagination

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
        { search: paginated_data }
      end

      def collection_list
        collection_data['items'] || []
      end

      def collection_data
        response_data[collection_name] || {}
      end

      def link
        "#{BASE_LINK}/music-search.jsx"
      end

      def params
        {
          **super,
          text: @args[:query],
          type: collection_type,
          page: page - 1
        }
      end

      def collection_type
        self.class::COLLECTION_TYPE
      end

      def collection_name
        self.class::COLLECTION_NAME
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
