module Muffon
  module Utils
    module Pagination
      private

      def paginated_data
        {
          page: page,
          total_pages: total_pages_count,
          collection_name.to_sym => collection_data
        }.compact
      end

      def page
        (@args.page || 1).to_i
      end

      def total_pages_count
        return unless defined?(total_items_count)

        total_items_count.fdiv(limit).ceil
      end

      def limit
        (@args.limit || page_limit).to_i
      end

      def page_limit
        20
      end

      def paginated_data
        {
          page: page,
          next_page: next_page_formatted,
          total_pages: total_pages_count,
          collection_name.to_sym => collection
        }.compact
      end

      def collection_name
        self.class::COLLECTION_NAME
      end

      def next_page_formatted
        next_page if defined?(next_page)
      end

      def total_pages_count
        return unless defined?(total_items_count)

        total_items_count.fdiv(limit).ceil
      end

      def collection
        collection_list.map do |i|
          collection_item_data_formatted(i)
        end
      end

      def collection_paginated(collection)
        collection.slice(offset, limit) || []
      end

      def offset
        (page - 1) * limit
      end
    end
  end
end
