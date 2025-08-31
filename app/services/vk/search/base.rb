module VK
  module Search
    class Base < VK::Base
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
        response_data['items'] || []
      end

      def params
        {
          **super,
          q: query,
          count: limit,
          offset:
        }
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

      def collection_count
        if wrong_items_count?
          total_limit
        else
          items_count
        end
      end

      def wrong_items_count?
        items_count.zero? &&
          collection_list.present?
      end

      def items_count
        response_data['count'] || 0
      end

      def collection_name
        self.class::COLLECTION_NAME
      end
    end
  end
end
