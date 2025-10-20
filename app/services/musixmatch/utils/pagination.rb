module MusixMatch
  module Utils
    module Pagination
      include Muffon::Utils::Pagination

      private

      def params
        {
          **super,
          page:,
          page_size: limit
        }
      end

      def total_items_count
        response_data.dig(
          'message',
          'header',
          'available'
        ) || 0
      end

      def collection_list
        data =
          response_data.dig(
            'message',
            'body'
          )

        if data.present?
          data["#{model_name}_list"]
        else
          []
        end
      end
    end
  end
end
