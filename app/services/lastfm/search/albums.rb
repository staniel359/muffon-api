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

      def params
        {
          **super,
          album: @args[:query]
        }
      end

      def collection_item_data_formatted(album)
        LastFM::Search::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
