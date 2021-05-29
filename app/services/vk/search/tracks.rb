module VK
  module Search
    class Tracks < VK::Search::Base
      COLLECTION_NAME = 'tracks'.freeze

      private

      def collection_list
        results.dig('playlist', 'list')
      end

      def collection_item_data_formatted(track)
        VK::Search::Tracks::Track.call(
          track: track
        )
      end

      alias search_data paginated_data
    end
  end
end
