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

      def request_params
        {
          **super,
          type: SCOPES_PARAMS_DATA['labels']
        }
      end

      def collection_item_data_formatted(
        raw_label_data
      )
        Discogs::Search::Labels::Label.call(
          raw_label_data:
        )
      end
    end
  end
end
