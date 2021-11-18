module Genius
  module Search
    class Base < Genius::Base
      include Muffon::Utils::Pagination

      private

      def primary_args
        [@args[:query]]
      end

      def no_data?
        collection_list.empty?
      end

      def collection_list
        @collection_list ||= response_data.dig(
          'response', 'sections', 0, 'hits'
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
          page: page,
          per_page: limit
        }
      end

      def data
        { search: paginated_data }
      end

      def total_items_count
        1_000
      end
    end
  end
end
