module Audius
  module Search
    class Albums < Audius::Search::Base
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

      def raw_collection
        response_data.dig(
          'data',
          'albums'
        )
      end

      def request_params
        {
          **super,
          kind: 'albums'
        }
      end

      def collection_item_data_formatted(
        raw_album_data
      )
        Audius::Search::Albums::Album.call(
          raw_album_data:,
          **self_args
        )
      end
    end
  end
end
