module Bandcamp
  module Search
    class Albums < Bandcamp::Search::Base
      private

      def search_data
        paginated_data(
          collection_name: 'albums',
          raw_collection:,
          page:,
          limit:,
          is_fractioned: true
        )
      end

      def request_payload
        {
          **super,
          search_filter: SCOPES_TYPES_DATA['albums']
        }
      end

      def collection_item_data_formatted(
        raw_album_data
      )
        Bandcamp::Search::Albums::Album.call(
          raw_album_data:,
          **self_args
        )
      end
    end
  end
end
