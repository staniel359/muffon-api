module LastFM
  module Search
    class Albums < LastFM::Search::Base
      API_METHOD = 'album.search'.freeze

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

      def raw_collection
        response_data.dig(
          'results',
          'albummatches',
          'album'
        )
      end

      def request_params
        {
          **super,
          album: @args[:query]
        }
      end

      def collection_item_data_formatted(
        raw_album_data
      )
        LastFM::Search::Albums::Album.call(
          raw_album_data:,
          **self_args
        )
      end
    end
  end
end
