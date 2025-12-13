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

      def link
        "#{BASE_LINK}/artist"
      end

      def collection_item_data_formatted(artist)
        MusicBrainz::Search::Artists::Artist.call(
          artist:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
