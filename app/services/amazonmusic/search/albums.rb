module AmazonMusic
  module Search
    class Albums < AmazonMusic::Search::Base
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

      def request_url
        "#{REQUEST_BASE_URL}/searchCatalogAlbums"
      end

      def collection_item_data_formatted(
        raw_album_data
      )
        AmazonMusic::Search::Albums::Album.call(
          raw_album_data:,
          **self_args
        )
      end
    end
  end
end
