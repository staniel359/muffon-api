module LastFM
  module API
    module Paginated
      private

      def pagination_params
        { limit: total_limit }
      end

      def total_limit
        1_000
      end

      def page
        (@args.page || 1).to_i
      end

      def total_pages
        collection_list.size.fdiv(limit).ceil
      end

      def limit
        (@args.limit || 50).to_i
      end

      def collection_paginated
        collection_list.slice(offset, limit).to_a
      end

      def offset
        (page - 1) * limit
      end

      def collection_data
        collection_paginated.map { |i| collection_item_data(i) }
      end
    end
  end
end
