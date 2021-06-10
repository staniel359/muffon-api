module VK
  module Search
    class Videos < VK::Search::Base
      COLLECTION_NAME = 'videos'.freeze

      private

      def collection_list
        response_data.dig(1, 2)
      end

      def collection_item_data_formatted(video)
        VK::Search::Videos::Video.call(
          video: video
        )
      end

      alias search_data paginated_data
    end
  end
end
