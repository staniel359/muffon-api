module Odnoklassniki
  module Search
    class Albums < Odnoklassniki::Search::Base
      ENDPOINT_NAME = 'albums'.freeze

      private

      def search_data
        paginated_data(
          collection_name: 'albums',
          raw_collection:,
          page:,
          limit:,
          items_count:,
          maximum_items_count:
        )
      end

      def raw_collection
        response_data['albums']
      end

      def items_count
        response_data.dig(
          'relevantCounts',
          'albums'
        )
      end

      def collection_item_data_formatted(
        raw_album_data
      )
        Odnoklassniki::Search::Albums::Album.call(
          raw_album_data:,
          **self_args
        )
      end
    end
  end
end
