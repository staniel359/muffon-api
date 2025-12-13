module Odnoklassniki
  module Search
    class Artists < Odnoklassniki::Search::Base
      ENDPOINT_NAME = 'artists'.freeze

      private

      def search_data
        paginated_data(
          collection_name: 'artists',
          raw_collection:,
          page:,
          limit:,
          items_count:,
          maximum_items_count:
        )
      end

      def raw_collection
        [
          first_artist,
          *response_data['artists']
        ].compact
      end

      def first_artist
        response_data.dig(
          'bestMatch',
          'artist'
        )
      end

      def items_count
        response_data.dig(
          'relevantCounts',
          'artists'
        )
      end

      def collection_item_data_formatted(artist)
        Odnoklassniki::Search::Artists::Artist.call(
          artist:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
