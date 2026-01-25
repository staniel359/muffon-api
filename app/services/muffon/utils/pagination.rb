module Muffon
  module Utils
    module Pagination
      DEFAULT_PAGE = 1
      DEFAULT_PAGE_LIMIT = 20
      MAXIMUM_ITEMS_COUNT_DATA = {
        search: 500
      }.freeze

      private

      def page
        @args[:page] || DEFAULT_PAGE
      end

      def limit
        case @args[:limit]
        when Integer
          @args[:limit]
        when String
          @args[:limit].scan(/\d+/).join.to_i if @args[:limit].match?(/\d+/)
        when nil
          DEFAULT_PAGE_LIMIT
        end
      end

      def offset
        return if limit.blank?

        (page.to_i - 1) * limit
      end

      def paginated_data(
        collection_name:,
        raw_collection:,
        page: nil,
        previous_page: nil,
        next_page: nil,
        limit: nil,
        items_count: nil,
        pages_count: nil,
        is_fractioned: false,
        is_infinite: false,
        is_with_items_count: false,
        maximum_items_count: nil
      )
        Muffon::Utils::Collection::Paginator.call(
          collection_name:,
          raw_collection:,
          page:,
          next_page:,
          previous_page:,
          limit:,
          items_count:,
          pages_count:,
          is_fractioned:,
          is_infinite:,
          is_with_items_count:,
          maximum_items_count:,
          item_data_formatter: method(
            :collection_item_data_formatted
          )
        )
      end

      def order
        @args[:order]
      end

      def pagination_maximum_items_count_data
        MAXIMUM_ITEMS_COUNT_DATA
      end
    end
  end
end
