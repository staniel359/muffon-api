module MusixMatch
  module Utils
    module Pagination
      include Muffon::Utils::Pagination

      private

      def params
        super.merge(
          pagination_params
        )
      end

      def pagination_params
        {
          page:,
          page_size: limit
        }
      end

      def total_items_count
        response_data.dig(
          'message', 'header',
          'available'
        )
      end

      def collection_list
        response_data.dig(
          'message', 'body',
          "#{model_name}_list"
        )
      end
    end
  end
end
