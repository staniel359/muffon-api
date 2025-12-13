module LastFM
  module Search
    class Artists < LastFM::Search::Base
      API_METHOD = 'artist.search'.freeze

      private

      def search_data
        paginated_data(
          collection_name: 'artists',
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
          'artistmatches',
          'artist'
        )
      end

      def params
        {
          **super,
          artist: @args[:query]
        }
      end

      def collection_item_data_formatted(artist)
        LastFM::Search::Artists::Artist.call(
          artist:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
