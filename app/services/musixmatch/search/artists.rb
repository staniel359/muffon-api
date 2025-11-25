module MusixMatch
  module Search
    class Artists < MusixMatch::Search::Base
      private

      def search_data
        paginated_data(
          collection_name: 'artists',
          raw_collection:,
          page:,
          limit:,
          items_count:
        )
      end

      def raw_collection
        response_data.dig(
          'message',
          'body',
          'artist_list'
        )
      end

      def link
        "#{BASE_LINK}/artist.search"
      end

      def collection_item_data_formatted(artist)
        MusixMatch::Search::Artists::Artist.call(
          artist:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
