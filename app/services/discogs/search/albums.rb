module Discogs
  module Search
    class Albums < Discogs::Search::Base
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

      def params
        {
          **super,
          type: SCOPES_PARAMS_DATA['albums']
        }
      end

      def collection_item_data_formatted(
        raw_album_data
      )
        Discogs::Search::Albums::Album.call(
          raw_album_data:,
          **self_args
        )
      end
    end
  end
end
