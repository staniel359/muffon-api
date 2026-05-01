module MusicBrainz
  module Search
    class Albums < MusicBrainz::Search::Base
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
        response_data['releases']
      end

      def request_url
        "#{REQUEST_BASE_URL}/release"
      end

      def collection_item_data_formatted(
        raw_album_data
      )
        MusicBrainz::Search::Albums::Album.call(
          raw_album_data:,
          **self_args
        )
      end
    end
  end
end
