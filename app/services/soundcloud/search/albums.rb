module SoundCloud
  module Search
    class Albums < SoundCloud::Search::Base
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

      def request_url
        "#{REQUEST_BASE_URL}/search/albums"
      end

      def collection_item_data_formatted(
        raw_album_data
      )
        SoundCloud::Search::Albums::Album.call(
          raw_album_data:,
          **self_args
        )
      end
    end
  end
end
