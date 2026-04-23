module VK
  module Search
    class Albums < VK::Search::Base
      API_METHOD = 'audio.searchAlbums'.freeze

      private

      def search_data
        paginated_data(
          collection_name: 'albums',
          raw_collection:,
          page:,
          limit:,
          is_infinite: true,
          next_page:
        )
      end

      def collection_item_data_formatted(
        raw_album_data
      )
        VK::Search::Albums::Album.call(
          raw_album_data:,
          **self_args
        )
      end
    end
  end
end
