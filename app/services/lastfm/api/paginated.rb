module LastFM
  module API
    module Paginated
      TOTAL_LIMIT = 1_000

      private

      def pagination_params
        { limit: TOTAL_LIMIT }
      end

      def paginated_array(data)
        LastFM::Utils::PaginatedData.call(
          data: data,
          page: @args.page,
          limit: @args.limit
        )
      end

      def page
        paginated_data[:page]
      end

      def paginated_data
        @paginated_data ||= paginated_array(raw_collection)
      end

      def collection_data
        collection_list.map { |i| collection_item_data(i) }
      end

      def collection_list
        paginated_data[:collection]
      end

      def total_pages
        paginated_data[:total_pages]
      end
    end
  end
end
