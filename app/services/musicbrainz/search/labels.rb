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
          maximum_items_count: MAXIMUM_ITEMS_COUNT
        )
      end

      def raw_collection
        response_data['labels']
      end

      def link
        "#{BASE_LINK}/label"
      end

      def collection_item_data_formatted(label)
        MusicBrainz::Search::Labels::Label.call(
          label:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
