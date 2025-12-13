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

      def link
        "#{BASE_LINK}/release"
      end

      def collection_item_data_formatted(album)
        MusicBrainz::Search::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
