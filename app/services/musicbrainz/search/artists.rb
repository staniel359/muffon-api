module MusicBrainz
  module Search
    class Artists < MusicBrainz::Search::Base
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
        response_data['artists']
      end

      def request_url
        "#{REQUEST_BASE_URL}/artist"
      end

      def collection_item_data_formatted(
        raw_artist_data
      )
        MusicBrainz::Search::Artists::Artist.call(
          raw_artist_data:,
          **self_args
        )
      end
    end
  end
end
