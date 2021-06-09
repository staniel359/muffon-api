module VK
  module Search
    class Artists < VK::Search::Base
      COLLECTION_NAME = 'artists'.freeze

      private

      def collection_list
        response_data.dig(1, 2)
      end

      def collection_item_data_formatted(artist)
        VK::Search::Artists::Artist.call(
          artist: artist
        )
      end

      alias search_data paginated_data
    end
  end
end
