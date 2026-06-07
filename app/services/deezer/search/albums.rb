module Deezer
  module Search
    class Albums < Deezer::Search::Base
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

      def request_payload
        {
          **super,
          output: 'ALBUM'
        }.to_json
      end

      def collection_item_data_formatted(
        raw_album_data
      )
        Deezer::Search::Albums::Album.call(
          raw_album_data:,
          **self_args
        )
      end
    end
  end
end
