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
        if all_collection?
          total_items_count
        else
          (@args[:limit] || page_limit).to_i
        end
      end

      def all_collection?
        @args[:limit] == 'all'
      end

      def total_items_count
        [
          collection_count,
          total_limit
        ].min
      end

      def total_limit
        self.class::TOTAL_LIMIT
      end

      def page_limit
        self.class::PAGE_LIMIT
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

      def collection_name
        self.class::COLLECTION_NAME
      end

      def collection
        @collection ||=
          collection_list.map do |raw_collection_item_data|
            collection_item_data_formatted(
              raw_collection_item_data
            )
          end
      end

      def collection_paginated(
        collection
      )
        collection.slice(
          offset,
          limit
        ) || []
      end

      def offset
        (page - 1) * limit
      end

      def order
        @args[:order]
      end
    end
  end
end
