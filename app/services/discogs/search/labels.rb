module Discogs
  module Search
    class Labels < Discogs::Search::Base
      private

      def search_data
        paginated_data(
          collection_name: 'labels',
          raw_collection:,
          page:,
          limit:,
          items_count:,
          maximum_items_count:
        )
      end

      def params
        {
          **super,
          type: 'label'
        }
      end

      def collection_item_data_formatted(label)
        Discogs::Search::Labels::Label.call(
          label:
        )
      end
    end
  end
end
