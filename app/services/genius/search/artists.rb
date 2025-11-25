module Genius
  module Search
    class Artists < Genius::Search::Base
      private

      def search_data
        paginated_data(
          collection_name: 'artists',
          raw_collection:,
          page:,
          limit:,
          is_infinite: true,
          next_page:
        )
      end

      def link
        "#{BASE_LINK}/search/artist"
      end

      def collection_item_data_formatted(artist)
        Genius::Search::Artists::Artist.call(
          artist: artist['result'],
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
