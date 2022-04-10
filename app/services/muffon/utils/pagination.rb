module Muffon
  module Utils
    module Pagination
      PAGE_LIMIT = 20

      private

      def pagination_params
        {
          page:,
          limit:
        }
      end

      def page
        (@args[:page] || 1).to_i
      end

      def limit
        (
          @args[:limit] ||
            page_limit
        ).to_i
      end

      def page_limit
        PAGE_LIMIT
      end

      def paginated_data
        {
          page:,
          next_page:,
          total_pages: total_pages_count,
          collection_name.to_sym => collection
        }.compact
      end

      def next_page
        nil
      end

      def total_pages_count
        return if total_items_count.zero?

        total_items_count
          .fdiv(limit)
          .ceil
      end

      def total_items_count
        0
      end

      def collection_name
        self.class::COLLECTION_NAME
      end

      def collection
        collection_list.map do |i|
          collection_item_data_formatted(i)
        end
      end

      def collection_paginated(collection)
        collection.slice(
          offset, limit
        ) || []
      end

      def offset
        (page - 1) * limit
      end

      def page_out_of_bounds?
        return false if total_pages_count.nil?

        page < 1 ||
          page > total_pages_count
      end
    end
  end
end
