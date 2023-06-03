module Genius
  module Search
    class Base < Genius::Base
      TOTAL_LIMIT = 10_000

      include Muffon::Utils::Pagination

      private

      def primary_args
        [@args[:query]]
      end

      def collection_list
        response_data.dig(
          'response', 'sections',
          0, 'hits'
        )
      end

      def link
        "#{BASE_LINK}/search/#{model_name}"
      end

      def model_name
        self.class::MODEL_NAME
      end

      def params
        {
          q: @args[:query],
          page:,
          per_page: limit
        }
      end

      def data
        { search: paginated_data }
      end

      def total_items_count
        return 0 if collection_list.blank?

        total_limit
      end
    end
  end
end
