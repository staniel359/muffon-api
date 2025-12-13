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

      def collection_item_data_formatted(album)
        Odnoklassniki::Search::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
