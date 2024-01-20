module VK
  module Search
    class Base < VK::Base
      TOTAL_LIMIT = 10_000

      include Muffon::Utils::Pagination

      private

      def primary_args
        [@args[:query]]
      end

      def params
        super.merge(
          search_params
        )
      end

      def signature
        "/method/#{api_method}" \
          "?access_token=#{access_token}" \
          '&v=5.131' \
          "&q=#{query}" \
          "&count=#{limit}" \
          "&offset=#{offset}" \
          "#{api_secret}"
      end

      def query
        @args[:query]
      end

      def search_params
        {
          q: query,
          count: limit,
          offset:
        }
      end

      def data
        { search: paginated_data }
      end

      def collection_count
        return total_limit if wrong_items_count?

        items_count
      end

      def wrong_items_count?
        items_count.zero? &&
          collection_list.present?
      end

      def items_count
        response_data['count'] || 0
      end

      def collection_list
        response_data['items'] || []
      end

      def collection_name
        self.class::COLLECTION_NAME
      end
    end
  end
end
