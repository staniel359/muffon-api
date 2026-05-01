module MusicBrainz
  module Search
    class Labels < MusicBrainz::Search::Base
      MODEL_NAME = 'label'.freeze

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

      def raw_collection
        response_data['labels']
      end

      def request_url
        "#{REQUEST_BASE_URL}/label"
      end

      def collection_item_data_formatted(
        raw_label_data
      )
        MusicBrainz::Search::Labels::Label.call(
          raw_label_data:
        )
      end
    end
  end
end
