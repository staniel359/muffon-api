module VK
  module Search
    class Albums < VK::Search::Base
      COLLECTION_NAME = 'albums'.freeze

      private

      def collection_list
        results['playlists']
      end

      def collection_item_data_formatted(album)
        VK::Search::Albums::Album.call(
          album: album
        )
      end

      alias search_data paginated_data
    end
  end
end
